; DESCRIPTION: Draws a white line from (60, 53) to (421, 156).
; PLAN: r0=60(x1), r1=53(y1), r2=421(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 53
LDI r2, 421
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
