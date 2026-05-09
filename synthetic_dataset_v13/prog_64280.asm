; DESCRIPTION: Renders a blue line between points (399, 238) and (33, 166).
; PLAN: r0=399(x1), r1=238(y1), r2=33(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 238
LDI r2, 33
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
