; DESCRIPTION: Composite: Places a red circle of radius 60 at center (229, 101) then Sets a single cyan pixel at (383, 153).
; PLAN: r0=229(x), r1=101(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x), r6=153(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 229
LDI r1, 101
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 153
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
