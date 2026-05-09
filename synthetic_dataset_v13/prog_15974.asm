; DESCRIPTION: Composite: Renders a green box of size 10x100 starting at (379, 133) then Draws a purple line from (118, 102) to (236, 113).
; PLAN: r0=379(x), r1=133(y), r2=10(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x1), r6=102(y1), r7=236(x2), r8=113(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 133
LDI r2, 10
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 102
LDI r7, 236
LDI r8, 113
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
