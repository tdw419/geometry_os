; DESCRIPTION: Composite: Places a white dot at position (26, 190) then Renders a green line between points (333, 90) and (78, 67).
; PLAN: r0=26(x), r1=190(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=333(x1), r6=90(y1), r7=78(x2), r8=67(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 26
LDI r1, 190
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 333
LDI r6, 90
LDI r7, 78
LDI r8, 67
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
