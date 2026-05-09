; DESCRIPTION: Draws a white line from (473, 71) to (92, 63).
; PLAN: r0=473(x1), r1=71(y1), r2=92(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 71
LDI r2, 92
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
