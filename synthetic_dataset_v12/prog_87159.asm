; DESCRIPTION: Composite: Sets a single green pixel at (480, 49) then Places a magenta line segment connecting (158, 163) to (1, 46) then Renders a red disk with center (359, 39) and radius 13.
; PLAN: r0=480(x), r1=49(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=158(x1), r6=163(y1), r7=1(x2), r8=46(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=359(x), r11=39(y), r12=13(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 480
LDI r1, 49
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 158
LDI r6, 163
LDI r7, 1
LDI r8, 46
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 359
LDI r11, 39
LDI r12, 13
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
