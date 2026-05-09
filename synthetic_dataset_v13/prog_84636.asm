; DESCRIPTION: Composite: Draws a red line from (275, 247) to (293, 224) then Creates a red circular shape at (185, 164) with radius 49.
; PLAN: r0=275(x1), r1=247(y1), r2=293(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=164(y), r7=49(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 275
LDI r1, 247
LDI r2, 293
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 164
LDI r7, 49
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
