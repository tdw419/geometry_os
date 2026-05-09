; DESCRIPTION: Composite: Sets a single yellow pixel at (229, 219) then Draws a cyan line from (161, 72) to (418, 183).
; PLAN: r0=229(x), r1=219(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=161(x1), r6=72(y1), r7=418(x2), r8=183(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 219
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 161
LDI r6, 72
LDI r7, 418
LDI r8, 183
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
