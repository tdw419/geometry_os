; DESCRIPTION: Composite: Renders a orange line between points (321, 64) and (144, 16) then Sets a single cyan pixel at (494, 26).
; PLAN: r0=321(x1), r1=64(y1), r2=144(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=494(x), r6=26(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 321
LDI r1, 64
LDI r2, 144
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 494
LDI r6, 26
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
