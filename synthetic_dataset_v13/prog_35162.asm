; DESCRIPTION: Composite: Draws a black line from (439, 133) to (179, 142) then Draws a orange circle centered at (403, 189) with radius 36.
; PLAN: r0=439(x1), r1=133(y1), r2=179(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=403(x), r6=189(y), r7=36(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 439
LDI r1, 133
LDI r2, 179
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 189
LDI r7, 36
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
