; DESCRIPTION: Composite: Draws a blue line from (199, 243) to (395, 133) then Renders a red disk with center (162, 57) and radius 33.
; PLAN: r0=199(x1), r1=243(y1), r2=395(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=57(y), r7=33(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 199
LDI r1, 243
LDI r2, 395
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 57
LDI r7, 33
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
