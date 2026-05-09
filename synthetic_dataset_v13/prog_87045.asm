; DESCRIPTION: Composite: Draws a orange line from (323, 166) to (150, 13) then Renders a magenta box of size 98x10 starting at (135, 123).
; PLAN: r0=323(x1), r1=166(y1), r2=150(x2), r3=13(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=135(x), r6=123(y), r7=98(width), r8=10(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 166
LDI r2, 150
LDI r3, 13
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 123
LDI r7, 98
LDI r8, 10
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
