; DESCRIPTION: Composite: Renders a cyan line between points (289, 65) and (232, 223) then Places a cyan dot at position (237, 119).
; PLAN: r0=289(x1), r1=65(y1), r2=232(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=119(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 289
LDI r1, 65
LDI r2, 232
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 119
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
