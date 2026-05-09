; DESCRIPTION: Composite: Draws a orange line from (233, 158) to (239, 205) then Places a black dot at position (279, 131).
; PLAN: r0=233(x1), r1=158(y1), r2=239(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=131(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 233
LDI r1, 158
LDI r2, 239
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 131
LDI r7, 0x000000
PSET r5, r6, r7
HALT
