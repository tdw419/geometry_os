; DESCRIPTION: Composite: Sets a single cyan pixel at (88, 152) then Places a green line segment connecting (35, 65) to (359, 205).
; PLAN: r0=88(x), r1=152(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=35(x1), r6=65(y1), r7=359(x2), r8=205(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 152
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 35
LDI r6, 65
LDI r7, 359
LDI r8, 205
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
