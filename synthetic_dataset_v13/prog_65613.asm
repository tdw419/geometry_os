; DESCRIPTION: Composite: Draws a green line from (71, 119) to (31, 207) then Renders a blue box of size 79x66 starting at (219, 153).
; PLAN: r0=71(x1), r1=119(y1), r2=31(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=219(x), r6=153(y), r7=79(width), r8=66(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 71
LDI r1, 119
LDI r2, 31
LDI r3, 207
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 153
LDI r7, 79
LDI r8, 66
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
