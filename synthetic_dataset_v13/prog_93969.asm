; DESCRIPTION: Draws a white line from (439, 204) to (196, 114).
; PLAN: r0=439(x1), r1=204(y1), r2=196(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 204
LDI r2, 196
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
