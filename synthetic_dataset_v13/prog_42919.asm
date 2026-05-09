; DESCRIPTION: Composite: Creates a orange circular shape at (379, 91) with radius 61 then Draws a black line from (367, 236) to (453, 30).
; PLAN: r0=379(x), r1=91(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x1), r6=236(y1), r7=453(x2), r8=30(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 91
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 236
LDI r7, 453
LDI r8, 30
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
