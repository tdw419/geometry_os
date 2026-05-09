; DESCRIPTION: Composite: Draws a white line from (210, 34) to (134, 243) then Draws a white circle centered at (50, 89) with radius 45.
; PLAN: r0=210(x1), r1=34(y1), r2=134(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=89(y), r7=45(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 210
LDI r1, 34
LDI r2, 134
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 89
LDI r7, 45
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
