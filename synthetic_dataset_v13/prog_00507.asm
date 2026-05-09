; DESCRIPTION: Draws a white line from (152, 15) to (501, 44).
; PLAN: r0=152(x1), r1=15(y1), r2=501(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 15
LDI r2, 501
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
