; DESCRIPTION: Draws a white line from (107, 38) to (191, 156).
; PLAN: r0=107(x1), r1=38(y1), r2=191(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 38
LDI r2, 191
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
