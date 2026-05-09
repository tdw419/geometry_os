; DESCRIPTION: Draws a white line from (421, 117) to (470, 227).
; PLAN: r0=421(x1), r1=117(y1), r2=470(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 117
LDI r2, 470
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
