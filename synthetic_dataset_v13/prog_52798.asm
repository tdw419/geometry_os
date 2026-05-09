; DESCRIPTION: Draws a green line from (244, 63) to (75, 72).
; PLAN: r0=244(x1), r1=63(y1), r2=75(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 63
LDI r2, 75
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
