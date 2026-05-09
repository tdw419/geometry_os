; DESCRIPTION: Composite: Places a cyan dot at position (205, 216) then Places a blue line segment connecting (290, 91) to (80, 157).
; PLAN: r0=205(x), r1=216(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=290(x1), r6=91(y1), r7=80(x2), r8=157(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 205
LDI r1, 216
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 290
LDI r6, 91
LDI r7, 80
LDI r8, 157
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
