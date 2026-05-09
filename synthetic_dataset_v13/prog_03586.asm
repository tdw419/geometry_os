; DESCRIPTION: Renders a white line between points (405, 110) and (37, 86).
; PLAN: r0=405(x1), r1=110(y1), r2=37(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 110
LDI r2, 37
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
