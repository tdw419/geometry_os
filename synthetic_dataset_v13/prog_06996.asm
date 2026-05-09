; DESCRIPTION: Composite: Renders a orange line between points (256, 38) and (380, 162) then Renders a blue box of size 57x28 starting at (57, 78) then Places a blue dot at position (390, 226).
; PLAN: r0=256(x1), r1=38(y1), r2=380(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=57(x), r6=78(y), r7=57(width), r8=28(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=390(x), r11=226(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 256
LDI r1, 38
LDI r2, 380
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 78
LDI r7, 57
LDI r8, 28
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 226
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
