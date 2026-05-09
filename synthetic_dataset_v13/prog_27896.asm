; DESCRIPTION: Composite: Places a orange circle of radius 36 at center (249, 79) then Renders a black box of size 58x57 starting at (290, 109).
; PLAN: r0=249(x), r1=79(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=290(x), r6=109(y), r7=58(width), r8=57(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 249
LDI r1, 79
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 290
LDI r6, 109
LDI r7, 58
LDI r8, 57
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
