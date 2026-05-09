; DESCRIPTION: Composite: Sets a single yellow pixel at (117, 137) then Renders a blue disk with center (200, 183) and radius 64 then Renders a cyan line between points (48, 252) and (379, 167).
; PLAN: r0=117(x), r1=137(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=200(x), r6=183(y), r7=64(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=48(x1), r11=252(y1), r12=379(x2), r13=167(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 117
LDI r1, 137
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 200
LDI r6, 183
LDI r7, 64
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 48
LDI r11, 252
LDI r12, 379
LDI r13, 167
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
