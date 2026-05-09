; DESCRIPTION: Composite: Renders a blue line between points (56, 134) and (163, 54) then Renders a cyan box of size 23x35 starting at (137, 141) then Sets a single orange pixel at (173, 238).
; PLAN: r0=56(x1), r1=134(y1), r2=163(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=141(y), r7=23(width), r8=35(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=173(x), r11=238(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 56
LDI r1, 134
LDI r2, 163
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 141
LDI r7, 23
LDI r8, 35
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 173
LDI r11, 238
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
