; DESCRIPTION: Composite: Draws a blue line from (17, 49) to (456, 19) then Sets a single black pixel at (212, 228).
; PLAN: r0=17(x1), r1=49(y1), r2=456(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=212(x), r6=228(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 17
LDI r1, 49
LDI r2, 456
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 228
LDI r7, 0x000000
PSET r5, r6, r7
HALT
