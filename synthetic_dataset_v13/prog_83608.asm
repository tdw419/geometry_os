; DESCRIPTION: Composite: Places a orange line segment connecting (31, 99) to (315, 29) then Renders a white box of size 28x69 starting at (76, 125) then Places a green dot at position (218, 186).
; PLAN: r0=31(x1), r1=99(y1), r2=315(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=76(x), r6=125(y), r7=28(width), r8=69(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=218(x), r11=186(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 31
LDI r1, 99
LDI r2, 315
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 125
LDI r7, 28
LDI r8, 69
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 218
LDI r11, 186
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
