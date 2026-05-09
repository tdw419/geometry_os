; DESCRIPTION: Composite: Renders a green box of size 54x15 starting at (22, 126) then Draws a orange line from (214, 207) to (28, 191).
; PLAN: r0=22(x), r1=126(y), r2=54(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=214(x1), r6=207(y1), r7=28(x2), r8=191(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 22
LDI r1, 126
LDI r2, 54
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 207
LDI r7, 28
LDI r8, 191
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
