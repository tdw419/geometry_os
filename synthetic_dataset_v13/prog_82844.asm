; DESCRIPTION: Renders a white line between points (176, 66) and (437, 234).
; PLAN: r0=176(x1), r1=66(y1), r2=437(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 66
LDI r2, 437
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
