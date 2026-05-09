; DESCRIPTION: Draws a white line from (34, 65) to (31, 91).
; PLAN: r0=34(x1), r1=65(y1), r2=31(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 65
LDI r2, 31
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
