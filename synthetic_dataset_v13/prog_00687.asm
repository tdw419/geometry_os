; DESCRIPTION: Composite: Draws a red line from (71, 175) to (149, 174) then Sets a single cyan pixel at (330, 175).
; PLAN: r0=71(x1), r1=175(y1), r2=149(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=175(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 71
LDI r1, 175
LDI r2, 149
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 175
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
