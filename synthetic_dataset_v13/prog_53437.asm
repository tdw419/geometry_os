; DESCRIPTION: Draws a white line from (122, 114) to (331, 47).
; PLAN: r0=122(x1), r1=114(y1), r2=331(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 114
LDI r2, 331
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
