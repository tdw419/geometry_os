; DESCRIPTION: Composite: Draws a purple line from (385, 2) to (395, 184) then Sets a single cyan pixel at (464, 157).
; PLAN: r0=385(x1), r1=2(y1), r2=395(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=464(x), r6=157(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 385
LDI r1, 2
LDI r2, 395
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 157
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
