; DESCRIPTION: Composite: Renders a white box of size 31x107 starting at (154, 4) then Sets a single orange pixel at (400, 149).
; PLAN: r0=154(x), r1=4(y), r2=31(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x), r6=149(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 154
LDI r1, 4
LDI r2, 31
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 149
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
