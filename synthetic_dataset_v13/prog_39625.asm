; DESCRIPTION: Composite: Places a cyan line segment connecting (151, 72) to (383, 103) then Sets a single cyan pixel at (68, 222).
; PLAN: r0=151(x1), r1=72(y1), r2=383(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=222(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 151
LDI r1, 72
LDI r2, 383
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 222
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
