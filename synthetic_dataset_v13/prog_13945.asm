; DESCRIPTION: Composite: Draws a red line from (172, 235) to (259, 108) then Draws a yellow circle centered at (254, 174) with radius 70.
; PLAN: r0=172(x1), r1=235(y1), r2=259(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=174(y), r7=70(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 172
LDI r1, 235
LDI r2, 259
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 174
LDI r7, 70
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
