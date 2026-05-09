; DESCRIPTION: Composite: Sets a single green pixel at (337, 192) then Places a blue line segment connecting (210, 188) to (137, 118).
; PLAN: r0=337(x), r1=192(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=210(x1), r6=188(y1), r7=137(x2), r8=118(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 192
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 210
LDI r6, 188
LDI r7, 137
LDI r8, 118
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
