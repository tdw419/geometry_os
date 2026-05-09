; DESCRIPTION: Renders a blue line between points (405, 171) and (120, 21).
; PLAN: r0=405(x1), r1=171(y1), r2=120(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 171
LDI r2, 120
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
