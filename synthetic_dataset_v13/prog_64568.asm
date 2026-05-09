; DESCRIPTION: Composite: Renders a cyan box of size 120x101 starting at (55, 0) then Sets a single orange pixel at (114, 63).
; PLAN: r0=55(x), r1=0(y), r2=120(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=114(x), r6=63(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 55
LDI r1, 0
LDI r2, 120
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 63
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
