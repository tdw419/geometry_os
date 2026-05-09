; DESCRIPTION: Renders a green line between points (279, 111) and (429, 77).
; PLAN: r0=279(x1), r1=111(y1), r2=429(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 111
LDI r2, 429
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
