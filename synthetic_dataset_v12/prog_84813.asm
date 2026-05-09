; DESCRIPTION: Composite: Sets a single orange pixel at (219, 169) then Renders a purple box of size 23x34 starting at (290, 195).
; PLAN: r0=219(x), r1=169(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=290(x), r6=195(y), r7=23(width), r8=34(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 219
LDI r1, 169
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 290
LDI r6, 195
LDI r7, 23
LDI r8, 34
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
