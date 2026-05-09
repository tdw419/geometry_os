; DESCRIPTION: Draws a green line from (176, 77) to (62, 142).
; PLAN: r0=176(x1), r1=77(y1), r2=62(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 77
LDI r2, 62
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
