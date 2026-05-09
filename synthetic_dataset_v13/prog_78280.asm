; DESCRIPTION: Composite: Draws a white line from (439, 65) to (6, 113) then Sets a single green pixel at (338, 222).
; PLAN: r0=439(x1), r1=65(y1), r2=6(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=338(x), r6=222(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 439
LDI r1, 65
LDI r2, 6
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 222
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
