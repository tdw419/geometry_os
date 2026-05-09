; DESCRIPTION: Composite: Draws a purple line from (203, 90) to (500, 247) then Places a red dot at position (225, 5).
; PLAN: r0=203(x1), r1=90(y1), r2=500(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=225(x), r6=5(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 203
LDI r1, 90
LDI r2, 500
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 5
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
