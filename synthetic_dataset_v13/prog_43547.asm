; DESCRIPTION: Composite: Places a white dot at position (359, 8) then Places a yellow line segment connecting (180, 247) to (351, 117).
; PLAN: r0=359(x), r1=8(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=180(x1), r6=247(y1), r7=351(x2), r8=117(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 8
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 180
LDI r6, 247
LDI r7, 351
LDI r8, 117
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
