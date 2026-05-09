; DESCRIPTION: Composite: Places a yellow line segment connecting (135, 13) to (358, 26) then Places a cyan circle of radius 28 at center (369, 164) then Places a blue dot at position (22, 238).
; PLAN: r0=135(x1), r1=13(y1), r2=358(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=164(y), r7=28(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=22(x), r11=238(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 135
LDI r1, 13
LDI r2, 358
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 164
LDI r7, 28
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 22
LDI r11, 238
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
