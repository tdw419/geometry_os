; DESCRIPTION: Composite: Places a green dot at position (214, 175) then Places a blue line segment connecting (80, 106) to (24, 214).
; PLAN: r0=214(x), r1=175(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=80(x1), r6=106(y1), r7=24(x2), r8=214(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 175
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 80
LDI r6, 106
LDI r7, 24
LDI r8, 214
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
