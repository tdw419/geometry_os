; DESCRIPTION: Renders a white line between points (313, 95) and (27, 237).
; PLAN: r0=313(x1), r1=95(y1), r2=27(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 95
LDI r2, 27
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
