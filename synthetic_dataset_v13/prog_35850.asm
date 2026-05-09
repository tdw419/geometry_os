; DESCRIPTION: Draws a green line from (293, 244) to (324, 24).
; PLAN: r0=293(x1), r1=244(y1), r2=324(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 244
LDI r2, 324
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
