; DESCRIPTION: Composite: Draws a orange circle centered at (298, 155) with radius 61 then Draws a black line from (21, 72) to (77, 180).
; PLAN: r0=298(x), r1=155(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=21(x1), r6=72(y1), r7=77(x2), r8=180(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 298
LDI r1, 155
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 21
LDI r6, 72
LDI r7, 77
LDI r8, 180
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
