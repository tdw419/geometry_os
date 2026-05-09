; DESCRIPTION: Composite: Renders a green disk with center (297, 92) and radius 29 then Sets a single yellow pixel at (430, 88) then Renders a cyan line between points (382, 186) and (328, 59).
; PLAN: r0=297(x), r1=92(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=430(x), r6=88(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=382(x1), r11=186(y1), r12=328(x2), r13=59(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 92
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 430
LDI r6, 88
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 382
LDI r11, 186
LDI r12, 328
LDI r13, 59
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
