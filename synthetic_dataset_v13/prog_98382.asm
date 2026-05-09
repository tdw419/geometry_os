; DESCRIPTION: Draws a white line from (393, 170) to (421, 50).
; PLAN: r0=393(x1), r1=170(y1), r2=421(x2), r3=50(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 170
LDI r2, 421
LDI r3, 50
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
