; DESCRIPTION: Draws a white line from (399, 236) to (313, 163).
; PLAN: r0=399(x1), r1=236(y1), r2=313(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 236
LDI r2, 313
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
