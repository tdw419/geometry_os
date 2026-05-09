; DESCRIPTION: Renders a red line between points (37, 111) and (293, 64).
; PLAN: r0=37(x1), r1=111(y1), r2=293(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 111
LDI r2, 293
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
