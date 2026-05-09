; DESCRIPTION: Composite: Draws a black line from (315, 110) to (235, 12) then Renders a blue box of size 67x89 starting at (400, 86).
; PLAN: r0=315(x1), r1=110(y1), r2=235(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=86(y), r7=67(width), r8=89(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 315
LDI r1, 110
LDI r2, 235
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 86
LDI r7, 67
LDI r8, 89
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
