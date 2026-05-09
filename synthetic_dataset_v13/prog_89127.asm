; DESCRIPTION: Composite: Places a red dot at position (227, 44) then Draws a cyan line from (78, 245) to (192, 70).
; PLAN: r0=227(x), r1=44(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=78(x1), r6=245(y1), r7=192(x2), r8=70(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 227
LDI r1, 44
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 78
LDI r6, 245
LDI r7, 192
LDI r8, 70
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
