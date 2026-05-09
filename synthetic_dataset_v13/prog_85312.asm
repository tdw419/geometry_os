; DESCRIPTION: Composite: Renders a yellow line between points (206, 5) and (361, 234) then Draws a yellow circle centered at (475, 65) with radius 37.
; PLAN: r0=206(x1), r1=5(y1), r2=361(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=475(x), r6=65(y), r7=37(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 206
LDI r1, 5
LDI r2, 361
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 475
LDI r6, 65
LDI r7, 37
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
