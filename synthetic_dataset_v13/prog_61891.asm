; DESCRIPTION: Draws a white line from (158, 27) to (97, 177).
; PLAN: r0=158(x1), r1=27(y1), r2=97(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 27
LDI r2, 97
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
