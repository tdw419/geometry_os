; DESCRIPTION: Composite: Draws a white circle centered at (281, 145) with radius 73 then Draws a blue line from (142, 77) to (83, 61).
; PLAN: r0=281(x), r1=145(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=142(x1), r6=77(y1), r7=83(x2), r8=61(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 145
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 142
LDI r6, 77
LDI r7, 83
LDI r8, 61
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
