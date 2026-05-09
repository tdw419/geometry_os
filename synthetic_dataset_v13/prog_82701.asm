; DESCRIPTION: Composite: Renders a cyan line between points (42, 37) and (501, 162) then Sets a single white pixel at (492, 155).
; PLAN: r0=42(x1), r1=37(y1), r2=501(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=492(x), r6=155(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 42
LDI r1, 37
LDI r2, 501
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 155
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
