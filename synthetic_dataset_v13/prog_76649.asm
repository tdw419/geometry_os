; DESCRIPTION: Composite: Renders a orange box of size 63x25 starting at (195, 117) then Draws a orange line from (57, 92) to (163, 223).
; PLAN: r0=195(x), r1=117(y), r2=63(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=57(x1), r6=92(y1), r7=163(x2), r8=223(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 195
LDI r1, 117
LDI r2, 63
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 92
LDI r7, 163
LDI r8, 223
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
