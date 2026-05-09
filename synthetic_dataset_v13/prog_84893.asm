; DESCRIPTION: Composite: Draws a blue line from (209, 116) to (343, 70) then Draws a green circle centered at (453, 91) with radius 11.
; PLAN: r0=209(x1), r1=116(y1), r2=343(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=453(x), r6=91(y), r7=11(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 209
LDI r1, 116
LDI r2, 343
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 91
LDI r7, 11
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
