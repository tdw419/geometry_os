; DESCRIPTION: Composite: Renders a purple box of size 80x34 starting at (293, 6) then Sets a single orange pixel at (455, 194).
; PLAN: r0=293(x), r1=6(y), r2=80(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=455(x), r6=194(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 293
LDI r1, 6
LDI r2, 80
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 194
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
