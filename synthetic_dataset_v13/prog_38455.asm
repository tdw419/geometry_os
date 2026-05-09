; DESCRIPTION: Draws a green line from (367, 34) to (359, 91).
; PLAN: r0=367(x1), r1=34(y1), r2=359(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 34
LDI r2, 359
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
