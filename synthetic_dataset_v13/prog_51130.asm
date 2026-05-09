; DESCRIPTION: Composite: Draws a cyan line from (62, 170) to (334, 171) then Places a red dot at position (450, 74).
; PLAN: r0=62(x1), r1=170(y1), r2=334(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=450(x), r6=74(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 62
LDI r1, 170
LDI r2, 334
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 74
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
