; DESCRIPTION: Draws a green line from (439, 244) to (454, 18).
; PLAN: r0=439(x1), r1=244(y1), r2=454(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 244
LDI r2, 454
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
