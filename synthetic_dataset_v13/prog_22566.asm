; DESCRIPTION: Draws a white line from (491, 46) to (112, 124).
; PLAN: r0=491(x1), r1=46(y1), r2=112(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 46
LDI r2, 112
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
