; DESCRIPTION: Composite: Draws a red line from (118, 94) to (91, 209) then Sets a single green pixel at (382, 164).
; PLAN: r0=118(x1), r1=94(y1), r2=91(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=164(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 118
LDI r1, 94
LDI r2, 91
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 164
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
