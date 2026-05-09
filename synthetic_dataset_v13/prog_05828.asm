; DESCRIPTION: Composite: Places a orange line segment connecting (177, 46) to (493, 178) then Renders a magenta disk with center (226, 177) and radius 39.
; PLAN: r0=177(x1), r1=46(y1), r2=493(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=226(x), r6=177(y), r7=39(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 177
LDI r1, 46
LDI r2, 493
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 177
LDI r7, 39
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
