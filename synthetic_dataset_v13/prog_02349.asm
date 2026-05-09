; DESCRIPTION: Composite: Draws a orange circle centered at (123, 191) with radius 57 then Renders a red line between points (433, 152) and (150, 42).
; PLAN: r0=123(x), r1=191(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x1), r6=152(y1), r7=150(x2), r8=42(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 123
LDI r1, 191
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 152
LDI r7, 150
LDI r8, 42
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
