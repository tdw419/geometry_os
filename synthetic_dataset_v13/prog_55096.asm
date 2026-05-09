; DESCRIPTION: Composite: Renders a green line between points (293, 178) and (320, 241) then Places a purple dot at position (511, 220).
; PLAN: r0=293(x1), r1=178(y1), r2=320(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=511(x), r6=220(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 293
LDI r1, 178
LDI r2, 320
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 220
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
