; DESCRIPTION: Composite: Places a purple dot at position (62, 38) then Draws a cyan line from (40, 80) to (190, 133).
; PLAN: r0=62(x), r1=38(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=40(x1), r6=80(y1), r7=190(x2), r8=133(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 62
LDI r1, 38
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 40
LDI r6, 80
LDI r7, 190
LDI r8, 133
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
