; DESCRIPTION: Draws a white line from (97, 243) to (112, 173).
; PLAN: r0=97(x1), r1=243(y1), r2=112(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 243
LDI r2, 112
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
