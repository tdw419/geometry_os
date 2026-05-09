; DESCRIPTION: Draws a white line from (403, 91) to (26, 94).
; PLAN: r0=403(x1), r1=91(y1), r2=26(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 91
LDI r2, 26
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
