; DESCRIPTION: Composite: Places a red dot at position (241, 172) then Draws a cyan line from (356, 11) to (227, 187).
; PLAN: r0=241(x), r1=172(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=356(x1), r6=11(y1), r7=227(x2), r8=187(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 172
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 356
LDI r6, 11
LDI r7, 227
LDI r8, 187
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
