; DESCRIPTION: Composite: Draws a green line from (427, 186) to (256, 181) then Places a blue dot at position (35, 177).
; PLAN: r0=427(x1), r1=186(y1), r2=256(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=35(x), r6=177(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 427
LDI r1, 186
LDI r2, 256
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 177
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
