; DESCRIPTION: Composite: Draws a white line from (193, 2) to (107, 204) then Renders a yellow disk with center (234, 65) and radius 55.
; PLAN: r0=193(x1), r1=2(y1), r2=107(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=234(x), r6=65(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 193
LDI r1, 2
LDI r2, 107
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 65
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
