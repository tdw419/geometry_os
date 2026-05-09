; DESCRIPTION: Renders a cyan line between points (390, 34) and (152, 237).
; PLAN: r0=390(x1), r1=34(y1), r2=152(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 34
LDI r2, 152
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
