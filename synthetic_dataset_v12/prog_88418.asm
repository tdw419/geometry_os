; DESCRIPTION: Renders a white line between points (491, 92) and (288, 60).
; PLAN: r0=491(x1), r1=92(y1), r2=288(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 92
LDI r2, 288
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
