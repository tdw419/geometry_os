; DESCRIPTION: Composite: Renders a cyan box of size 110x87 starting at (223, 26) then Sets a single cyan pixel at (153, 162).
; PLAN: r0=223(x), r1=26(y), r2=110(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=153(x), r6=162(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 223
LDI r1, 26
LDI r2, 110
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 162
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
