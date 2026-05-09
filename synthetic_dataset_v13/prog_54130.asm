; DESCRIPTION: Draws a white line from (324, 44) to (226, 49).
; PLAN: r0=324(x1), r1=44(y1), r2=226(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 44
LDI r2, 226
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
