; DESCRIPTION: Composite: Places a green circle of radius 12 at center (222, 205) then Places a cyan line segment connecting (486, 126) to (365, 241).
; PLAN: r0=222(x), r1=205(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=486(x1), r6=126(y1), r7=365(x2), r8=241(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 205
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 486
LDI r6, 126
LDI r7, 365
LDI r8, 241
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
