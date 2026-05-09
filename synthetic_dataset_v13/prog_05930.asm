; DESCRIPTION: Renders a white line between points (86, 137) and (465, 237).
; PLAN: r0=86(x1), r1=137(y1), r2=465(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 137
LDI r2, 465
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
