; DESCRIPTION: Composite: Sets a single white pixel at (360, 236) then Renders a blue disk with center (70, 137) and radius 32 then Renders a yellow line between points (271, 253) and (77, 168).
; PLAN: r0=360(x), r1=236(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=70(x), r6=137(y), r7=32(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=271(x1), r11=253(y1), r12=77(x2), r13=168(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 236
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 70
LDI r6, 137
LDI r7, 32
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 271
LDI r11, 253
LDI r12, 77
LDI r13, 168
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
