; DESCRIPTION: Composite: Places a green dot at position (356, 92) then Places a purple line segment connecting (392, 118) to (347, 206).
; PLAN: r0=356(x), r1=92(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=392(x1), r6=118(y1), r7=347(x2), r8=206(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 92
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 392
LDI r6, 118
LDI r7, 347
LDI r8, 206
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
