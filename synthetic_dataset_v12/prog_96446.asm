; DESCRIPTION: Renders a white line between points (446, 137) and (430, 108).
; PLAN: r0=446(x1), r1=137(y1), r2=430(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 137
LDI r2, 430
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
