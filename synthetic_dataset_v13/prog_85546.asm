; DESCRIPTION: Composite: Draws a magenta line from (8, 214) to (316, 227) then Renders a red box of size 27x87 starting at (134, 79).
; PLAN: r0=8(x1), r1=214(y1), r2=316(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=134(x), r6=79(y), r7=27(width), r8=87(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 8
LDI r1, 214
LDI r2, 316
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 79
LDI r7, 27
LDI r8, 87
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
