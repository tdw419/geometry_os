; DESCRIPTION: Draws a white line from (383, 215) to (112, 130).
; PLAN: r0=383(x1), r1=215(y1), r2=112(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 215
LDI r2, 112
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
