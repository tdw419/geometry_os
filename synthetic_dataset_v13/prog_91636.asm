; DESCRIPTION: Composite: Draws a red line from (371, 188) to (353, 172) then Sets a single magenta pixel at (434, 162).
; PLAN: r0=371(x1), r1=188(y1), r2=353(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=434(x), r6=162(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 371
LDI r1, 188
LDI r2, 353
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 162
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
