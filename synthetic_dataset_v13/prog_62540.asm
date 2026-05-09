; DESCRIPTION: Composite: Places a cyan line segment connecting (167, 93) to (39, 215) then Sets a single red pixel at (231, 224).
; PLAN: r0=167(x1), r1=93(y1), r2=39(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=231(x), r6=224(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 167
LDI r1, 93
LDI r2, 39
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 224
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
