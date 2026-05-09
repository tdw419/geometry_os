; DESCRIPTION: Composite: Renders a green line between points (228, 176) and (36, 106) then Places a red dot at position (465, 175).
; PLAN: r0=228(x1), r1=176(y1), r2=36(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=465(x), r6=175(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 228
LDI r1, 176
LDI r2, 36
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 175
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
