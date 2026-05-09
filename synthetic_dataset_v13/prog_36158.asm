; DESCRIPTION: Composite: Sets a single orange pixel at (264, 7) then Creates a orange rectangular region at (95, 137) spanning 70 by 10 pixels.
; PLAN: r0=264(x), r1=7(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=95(x), r6=137(y), r7=70(width), r8=10(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 7
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 95
LDI r6, 137
LDI r7, 70
LDI r8, 10
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
