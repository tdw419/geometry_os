; DESCRIPTION: Composite: Sets a single red pixel at (388, 158) then Renders a cyan box of size 10x25 starting at (13, 194).
; PLAN: r0=388(x), r1=158(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=13(x), r6=194(y), r7=10(width), r8=25(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 388
LDI r1, 158
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 13
LDI r6, 194
LDI r7, 10
LDI r8, 25
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
