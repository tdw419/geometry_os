; DESCRIPTION: Composite: Places a cyan line segment connecting (231, 226) to (500, 93) then Sets a single yellow pixel at (116, 241).
; PLAN: r0=231(x1), r1=226(y1), r2=500(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=241(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 231
LDI r1, 226
LDI r2, 500
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 241
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
