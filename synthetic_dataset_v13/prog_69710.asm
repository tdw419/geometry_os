; DESCRIPTION: Composite: Draws a cyan line from (42, 70) to (478, 29) then Sets a single red pixel at (206, 65).
; PLAN: r0=42(x1), r1=70(y1), r2=478(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=65(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 42
LDI r1, 70
LDI r2, 478
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 65
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
