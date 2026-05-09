; DESCRIPTION: Composite: Places a orange dot at position (471, 45) then Draws a blue rectangle at (42, 57) with width 21 and height 99 then Places a blue line segment connecting (446, 117) to (188, 68).
; PLAN: r0=471(x), r1=45(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=42(x), r6=57(y), r7=21(width), r8=99(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=446(x1), r11=117(y1), r12=188(x2), r13=68(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 471
LDI r1, 45
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 42
LDI r6, 57
LDI r7, 21
LDI r8, 99
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 446
LDI r11, 117
LDI r12, 188
LDI r13, 68
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
