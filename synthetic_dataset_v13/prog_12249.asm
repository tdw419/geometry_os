; DESCRIPTION: Composite: Places a red line segment connecting (418, 107) to (485, 206) then Renders a blue box of size 77x93 starting at (377, 157).
; PLAN: r0=418(x1), r1=107(y1), r2=485(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=377(x), r6=157(y), r7=77(width), r8=93(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 418
LDI r1, 107
LDI r2, 485
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 157
LDI r7, 77
LDI r8, 93
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
