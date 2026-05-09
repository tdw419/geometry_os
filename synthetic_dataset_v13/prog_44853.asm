; DESCRIPTION: Composite: Draws a cyan line from (187, 93) to (94, 58) then Places a green dot at position (292, 139).
; PLAN: r0=187(x1), r1=93(y1), r2=94(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=292(x), r6=139(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 187
LDI r1, 93
LDI r2, 94
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 139
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
