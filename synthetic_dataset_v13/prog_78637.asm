; DESCRIPTION: Renders a white line between points (47, 59) and (429, 87).
; PLAN: r0=47(x1), r1=59(y1), r2=429(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 59
LDI r2, 429
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
