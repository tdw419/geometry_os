; DESCRIPTION: Composite: Draws a purple line from (295, 29) to (265, 1) then Sets a single yellow pixel at (226, 108).
; PLAN: r0=295(x1), r1=29(y1), r2=265(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=226(x), r6=108(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 295
LDI r1, 29
LDI r2, 265
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 108
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
