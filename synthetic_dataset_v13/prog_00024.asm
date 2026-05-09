; DESCRIPTION: Draws a white line from (14, 226) to (140, 87).
; PLAN: r0=14(x1), r1=226(y1), r2=140(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 226
LDI r2, 140
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
