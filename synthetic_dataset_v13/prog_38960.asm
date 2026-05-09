; DESCRIPTION: Draws a white line from (347, 93) to (253, 195).
; PLAN: r0=347(x1), r1=93(y1), r2=253(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 93
LDI r2, 253
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
