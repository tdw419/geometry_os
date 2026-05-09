; DESCRIPTION: Composite: Renders a cyan line between points (320, 35) and (0, 79) then Sets a single yellow pixel at (276, 79).
; PLAN: r0=320(x1), r1=35(y1), r2=0(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=276(x), r6=79(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 320
LDI r1, 35
LDI r2, 0
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 79
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
