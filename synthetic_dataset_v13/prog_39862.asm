; DESCRIPTION: Composite: Places a purple line segment connecting (336, 142) to (157, 193) then Places a magenta dot at position (328, 158).
; PLAN: r0=336(x1), r1=142(y1), r2=157(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=328(x), r6=158(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 336
LDI r1, 142
LDI r2, 157
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 158
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
