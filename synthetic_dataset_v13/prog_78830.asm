; DESCRIPTION: Composite: Draws a blue rectangle at (201, 191) with width 33 and height 45 then Draws a blue line from (397, 148) to (407, 72).
; PLAN: r0=201(x), r1=191(y), r2=33(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=397(x1), r6=148(y1), r7=407(x2), r8=72(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 201
LDI r1, 191
LDI r2, 33
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 148
LDI r7, 407
LDI r8, 72
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
