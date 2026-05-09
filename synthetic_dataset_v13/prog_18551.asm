; DESCRIPTION: Draws a white line from (106, 132) to (82, 56).
; PLAN: r0=106(x1), r1=132(y1), r2=82(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 132
LDI r2, 82
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
