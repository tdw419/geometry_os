; DESCRIPTION: Renders a blue line between points (338, 132) and (410, 19).
; PLAN: r0=338(x1), r1=132(y1), r2=410(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 132
LDI r2, 410
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
