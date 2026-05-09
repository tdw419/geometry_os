; DESCRIPTION: Composite: Places a blue line segment connecting (183, 98) to (165, 1) then Draws a orange rectangle at (127, 48) with width 109 and height 37.
; PLAN: r0=183(x1), r1=98(y1), r2=165(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=127(x), r6=48(y), r7=109(width), r8=37(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 183
LDI r1, 98
LDI r2, 165
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 48
LDI r7, 109
LDI r8, 37
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
