; DESCRIPTION: Composite: Renders a white box of size 15x28 starting at (149, 183) then Places a blue line segment connecting (359, 32) to (146, 233) then Sets a single black pixel at (176, 59).
; PLAN: r0=149(x), r1=183(y), r2=15(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=359(x1), r6=32(y1), r7=146(x2), r8=233(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=176(x), r11=59(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 149
LDI r1, 183
LDI r2, 15
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 32
LDI r7, 146
LDI r8, 233
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 59
LDI r12, 0x000000
PSET r10, r11, r12
HALT
