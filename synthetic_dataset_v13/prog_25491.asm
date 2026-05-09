; DESCRIPTION: Renders a white line between points (315, 94) and (71, 86).
; PLAN: r0=315(x1), r1=94(y1), r2=71(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 94
LDI r2, 71
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
