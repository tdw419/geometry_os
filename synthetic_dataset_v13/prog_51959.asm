; DESCRIPTION: Composite: Draws a cyan line from (181, 50) to (64, 178) then Places a white dot at position (194, 155).
; PLAN: r0=181(x1), r1=50(y1), r2=64(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=155(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 181
LDI r1, 50
LDI r2, 64
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 155
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
