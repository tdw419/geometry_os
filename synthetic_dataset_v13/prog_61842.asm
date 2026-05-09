; DESCRIPTION: Draws a white line from (258, 142) to (433, 33).
; PLAN: r0=258(x1), r1=142(y1), r2=433(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 142
LDI r2, 433
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
