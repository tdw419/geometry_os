; DESCRIPTION: Draws a white line from (27, 6) to (77, 63).
; PLAN: r0=27(x1), r1=6(y1), r2=77(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 6
LDI r2, 77
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
