; DESCRIPTION: Draws a green line from (367, 6) to (85, 13).
; PLAN: r0=367(x1), r1=6(y1), r2=85(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 6
LDI r2, 85
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
