; DESCRIPTION: Composite: Draws a cyan line from (506, 210) to (226, 26) then Places a cyan dot at position (276, 24).
; PLAN: r0=506(x1), r1=210(y1), r2=226(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=276(x), r6=24(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 506
LDI r1, 210
LDI r2, 226
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 24
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
