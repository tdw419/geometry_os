; DESCRIPTION: Composite: Places a magenta 96x56 rectangle at position (252, 122) then Draws a magenta line from (262, 91) to (438, 14).
; PLAN: r0=252(x), r1=122(y), r2=96(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=262(x1), r6=91(y1), r7=438(x2), r8=14(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 122
LDI r2, 96
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 91
LDI r7, 438
LDI r8, 14
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
