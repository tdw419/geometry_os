; DESCRIPTION: Composite: Draws a orange line from (58, 47) to (287, 85) then Sets a single blue pixel at (215, 42).
; PLAN: r0=58(x1), r1=47(y1), r2=287(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=42(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 58
LDI r1, 47
LDI r2, 287
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 42
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
