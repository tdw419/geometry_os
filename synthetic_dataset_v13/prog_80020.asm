; DESCRIPTION: Composite: Places a yellow dot at position (114, 197) then Draws a purple line from (33, 193) to (47, 52).
; PLAN: r0=114(x), r1=197(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=33(x1), r6=193(y1), r7=47(x2), r8=52(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 114
LDI r1, 197
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 33
LDI r6, 193
LDI r7, 47
LDI r8, 52
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
