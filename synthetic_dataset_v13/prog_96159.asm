; DESCRIPTION: Composite: Draws a red line from (350, 70) to (426, 78) then Renders a red disk with center (69, 118) and radius 67.
; PLAN: r0=350(x1), r1=70(y1), r2=426(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=69(x), r6=118(y), r7=67(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 350
LDI r1, 70
LDI r2, 426
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 118
LDI r7, 67
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
