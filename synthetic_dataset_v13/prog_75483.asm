; DESCRIPTION: Composite: Draws a orange line from (463, 128) to (317, 116) then Renders a magenta box of size 69x47 starting at (43, 68).
; PLAN: r0=463(x1), r1=128(y1), r2=317(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=43(x), r6=68(y), r7=69(width), r8=47(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 463
LDI r1, 128
LDI r2, 317
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 68
LDI r7, 69
LDI r8, 47
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
