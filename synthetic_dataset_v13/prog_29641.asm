; DESCRIPTION: Composite: Creates a orange rectangular region at (127, 123) spanning 109 by 100 pixels then Places a black line segment connecting (8, 255) to (144, 241) then Places a blue dot at position (98, 103).
; PLAN: r0=127(x), r1=123(y), r2=109(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=8(x1), r6=255(y1), r7=144(x2), r8=241(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=98(x), r11=103(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 127
LDI r1, 123
LDI r2, 109
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 8
LDI r6, 255
LDI r7, 144
LDI r8, 241
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 103
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
