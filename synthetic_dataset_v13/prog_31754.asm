; DESCRIPTION: Composite: Sets a single blue pixel at (174, 157) then Places a yellow line segment connecting (329, 70) to (350, 35).
; PLAN: r0=174(x), r1=157(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=329(x1), r6=70(y1), r7=350(x2), r8=35(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 174
LDI r1, 157
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 329
LDI r6, 70
LDI r7, 350
LDI r8, 35
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
