; DESCRIPTION: Composite: Draws a white line from (359, 63) to (165, 10) then Draws a white circle centered at (399, 34) with radius 22.
; PLAN: r0=359(x1), r1=63(y1), r2=165(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=399(x), r6=34(y), r7=22(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 359
LDI r1, 63
LDI r2, 165
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 34
LDI r7, 22
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
