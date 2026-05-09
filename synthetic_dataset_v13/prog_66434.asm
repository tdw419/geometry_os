; DESCRIPTION: Composite: Sets a single red pixel at (511, 109) then Renders a green box of size 85x12 starting at (325, 50).
; PLAN: r0=511(x), r1=109(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=325(x), r6=50(y), r7=85(width), r8=12(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 511
LDI r1, 109
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 325
LDI r6, 50
LDI r7, 85
LDI r8, 12
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
