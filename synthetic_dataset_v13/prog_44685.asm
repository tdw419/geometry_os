; DESCRIPTION: Composite: Places a white dot at position (238, 138) then Places a orange line segment connecting (448, 38) to (359, 192).
; PLAN: r0=238(x), r1=138(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=448(x1), r6=38(y1), r7=359(x2), r8=192(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 138
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 448
LDI r6, 38
LDI r7, 359
LDI r8, 192
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
