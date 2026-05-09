; DESCRIPTION: Composite: Draws a orange rectangle at (164, 102) with width 103 and height 85 then Renders a blue line between points (166, 176) and (234, 80) then Places a blue dot at position (40, 234).
; PLAN: r0=164(x), r1=102(y), r2=103(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=166(x1), r6=176(y1), r7=234(x2), r8=80(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=40(x), r11=234(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 102
LDI r2, 103
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 176
LDI r7, 234
LDI r8, 80
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 40
LDI r11, 234
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
