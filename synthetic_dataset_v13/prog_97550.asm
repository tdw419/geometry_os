; DESCRIPTION: Composite: Sets a single cyan pixel at (297, 157) then Places a orange line segment connecting (207, 238) to (54, 48).
; PLAN: r0=297(x), r1=157(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=207(x1), r6=238(y1), r7=54(x2), r8=48(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 297
LDI r1, 157
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 207
LDI r6, 238
LDI r7, 54
LDI r8, 48
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
