; DESCRIPTION: Draws a white line from (140, 124) to (59, 51).
; PLAN: r0=140(x1), r1=124(y1), r2=59(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 124
LDI r2, 59
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
