; DESCRIPTION: Composite: Draws a orange line from (277, 96) to (285, 211) then Draws a white circle centered at (282, 60) with radius 25.
; PLAN: r0=277(x1), r1=96(y1), r2=285(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=60(y), r7=25(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 277
LDI r1, 96
LDI r2, 285
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 60
LDI r7, 25
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
