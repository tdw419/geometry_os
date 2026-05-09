; DESCRIPTION: Renders a white line between points (123, 7) and (234, 237).
; PLAN: r0=123(x1), r1=7(y1), r2=234(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 7
LDI r2, 234
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
