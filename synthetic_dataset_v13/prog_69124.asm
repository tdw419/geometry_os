; DESCRIPTION: Composite: Places a orange circle of radius 50 at center (109, 118) then Draws a white line from (403, 87) to (173, 245).
; PLAN: r0=109(x), r1=118(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=403(x1), r6=87(y1), r7=173(x2), r8=245(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 109
LDI r1, 118
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 403
LDI r6, 87
LDI r7, 173
LDI r8, 245
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
