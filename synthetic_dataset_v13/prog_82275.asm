; DESCRIPTION: Composite: Creates a orange circular shape at (186, 82) with radius 61 then Renders a white line between points (180, 200) and (45, 245).
; PLAN: r0=186(x), r1=82(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=180(x1), r6=200(y1), r7=45(x2), r8=245(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 186
LDI r1, 82
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 180
LDI r6, 200
LDI r7, 45
LDI r8, 245
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
