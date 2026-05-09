; DESCRIPTION: Composite: Sets a single red pixel at (215, 185) then Draws a blue line from (433, 64) to (332, 35).
; PLAN: r0=215(x), r1=185(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=433(x1), r6=64(y1), r7=332(x2), r8=35(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 215
LDI r1, 185
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 433
LDI r6, 64
LDI r7, 332
LDI r8, 35
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
