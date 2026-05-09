; DESCRIPTION: Draws a white line from (207, 106) to (421, 200).
; PLAN: r0=207(x1), r1=106(y1), r2=421(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 106
LDI r2, 421
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
