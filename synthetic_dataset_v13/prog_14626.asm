; DESCRIPTION: Renders a white line between points (173, 1) and (486, 72).
; PLAN: r0=173(x1), r1=1(y1), r2=486(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 1
LDI r2, 486
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
