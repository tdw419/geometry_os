; DESCRIPTION: Composite: Draws a yellow line from (299, 180) to (228, 29) then Sets a single yellow pixel at (248, 161).
; PLAN: r0=299(x1), r1=180(y1), r2=228(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=161(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 299
LDI r1, 180
LDI r2, 228
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 161
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
