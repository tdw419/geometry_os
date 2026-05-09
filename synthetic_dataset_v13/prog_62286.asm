; DESCRIPTION: Composite: Draws a cyan line from (195, 72) to (438, 136) then Places a purple circle of radius 30 at center (399, 222).
; PLAN: r0=195(x1), r1=72(y1), r2=438(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=399(x), r6=222(y), r7=30(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 195
LDI r1, 72
LDI r2, 438
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 222
LDI r7, 30
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
