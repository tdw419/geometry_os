; DESCRIPTION: Composite: Sets a single green pixel at (6, 83) then Renders a purple box of size 31x10 starting at (154, 212).
; PLAN: r0=6(x), r1=83(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=154(x), r6=212(y), r7=31(width), r8=10(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 6
LDI r1, 83
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 154
LDI r6, 212
LDI r7, 31
LDI r8, 10
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
