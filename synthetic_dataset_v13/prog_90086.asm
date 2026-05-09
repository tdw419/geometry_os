; DESCRIPTION: Composite: Draws a white circle centered at (294, 153) with radius 79 then Renders a yellow line between points (35, 243) and (10, 31).
; PLAN: r0=294(x), r1=153(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=35(x1), r6=243(y1), r7=10(x2), r8=31(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 153
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 35
LDI r6, 243
LDI r7, 10
LDI r8, 31
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
