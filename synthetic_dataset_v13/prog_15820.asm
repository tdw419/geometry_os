; DESCRIPTION: Composite: Sets a single orange pixel at (363, 20) then Renders a red box of size 11x63 starting at (273, 42).
; PLAN: r0=363(x), r1=20(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=273(x), r6=42(y), r7=11(width), r8=63(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 20
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 273
LDI r6, 42
LDI r7, 11
LDI r8, 63
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
