; DESCRIPTION: Draws a white line from (66, 252) to (509, 73).
; PLAN: r0=66(x1), r1=252(y1), r2=509(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 252
LDI r2, 509
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
