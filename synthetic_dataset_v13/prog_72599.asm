; DESCRIPTION: Draws a green line from (17, 192) to (293, 195).
; PLAN: r0=17(x1), r1=192(y1), r2=293(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 192
LDI r2, 293
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
