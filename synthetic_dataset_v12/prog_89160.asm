; DESCRIPTION: Composite: Renders a blue box of size 54x89 starting at (94, 32) then Renders a black line between points (341, 235) and (444, 159).
; PLAN: r0=94(x), r1=32(y), r2=54(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=341(x1), r6=235(y1), r7=444(x2), r8=159(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 94
LDI r1, 32
LDI r2, 54
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 235
LDI r7, 444
LDI r8, 159
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
