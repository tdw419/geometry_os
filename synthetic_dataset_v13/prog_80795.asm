; DESCRIPTION: Composite: Sets a single purple pixel at (50, 76) then Renders a orange box of size 87x61 starting at (85, 18).
; PLAN: r0=50(x), r1=76(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=85(x), r6=18(y), r7=87(width), r8=61(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 50
LDI r1, 76
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 85
LDI r6, 18
LDI r7, 87
LDI r8, 61
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
