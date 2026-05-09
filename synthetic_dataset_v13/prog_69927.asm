; DESCRIPTION: Composite: Renders a purple box of size 98x18 starting at (44, 77) then Draws a black line from (88, 132) to (316, 225).
; PLAN: r0=44(x), r1=77(y), r2=98(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x1), r6=132(y1), r7=316(x2), r8=225(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 44
LDI r1, 77
LDI r2, 98
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 132
LDI r7, 316
LDI r8, 225
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
