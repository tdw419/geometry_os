; DESCRIPTION: Composite: Draws a black line from (280, 100) to (458, 76) then Renders a magenta disk with center (271, 106) and radius 33.
; PLAN: r0=280(x1), r1=100(y1), r2=458(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=106(y), r7=33(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 280
LDI r1, 100
LDI r2, 458
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 106
LDI r7, 33
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
