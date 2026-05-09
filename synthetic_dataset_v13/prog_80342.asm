; DESCRIPTION: Composite: Draws a white line from (366, 36) to (379, 92) then Places a green dot at position (15, 105).
; PLAN: r0=366(x1), r1=36(y1), r2=379(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=15(x), r6=105(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 366
LDI r1, 36
LDI r2, 379
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 105
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
