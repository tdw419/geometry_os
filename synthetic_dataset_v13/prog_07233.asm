; DESCRIPTION: Composite: Renders a orange box of size 13x81 starting at (279, 65) then Sets a single orange pixel at (9, 87).
; PLAN: r0=279(x), r1=65(y), r2=13(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=9(x), r6=87(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 279
LDI r1, 65
LDI r2, 13
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 87
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
