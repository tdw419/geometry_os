; DESCRIPTION: Composite: Sets a single purple pixel at (201, 16) then Draws a white line from (144, 230) to (440, 181).
; PLAN: r0=201(x), r1=16(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=144(x1), r6=230(y1), r7=440(x2), r8=181(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 201
LDI r1, 16
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 144
LDI r6, 230
LDI r7, 440
LDI r8, 181
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
