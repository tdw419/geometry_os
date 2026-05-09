; DESCRIPTION: Composite: Draws a blue rectangle at (53, 97) with width 68 and height 107 then Places a magenta line segment connecting (61, 226) to (275, 205).
; PLAN: r0=53(x), r1=97(y), r2=68(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=61(x1), r6=226(y1), r7=275(x2), r8=205(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 53
LDI r1, 97
LDI r2, 68
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 226
LDI r7, 275
LDI r8, 205
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
