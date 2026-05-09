; DESCRIPTION: Composite: Renders a magenta box of size 53x82 starting at (424, 63) then Draws a orange line from (233, 2) to (50, 225).
; PLAN: r0=424(x), r1=63(y), r2=53(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x1), r6=2(y1), r7=50(x2), r8=225(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 424
LDI r1, 63
LDI r2, 53
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 2
LDI r7, 50
LDI r8, 225
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
