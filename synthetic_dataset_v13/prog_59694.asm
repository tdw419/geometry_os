; DESCRIPTION: Renders a black line between points (405, 57) and (473, 217).
; PLAN: r0=405(x1), r1=57(y1), r2=473(x2), r3=217(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 57
LDI r2, 473
LDI r3, 217
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
