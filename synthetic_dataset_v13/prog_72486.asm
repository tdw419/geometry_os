; DESCRIPTION: Composite: Draws a orange line from (53, 173) to (220, 56) then Renders a cyan box of size 22x105 starting at (106, 49) then Places a orange dot at position (205, 192).
; PLAN: r0=53(x1), r1=173(y1), r2=220(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=49(y), r7=22(width), r8=105(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=205(x), r11=192(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 53
LDI r1, 173
LDI r2, 220
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 49
LDI r7, 22
LDI r8, 105
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 192
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
