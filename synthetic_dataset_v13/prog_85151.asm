; DESCRIPTION: Renders a blue line between points (33, 127) and (361, 209).
; PLAN: r0=33(x1), r1=127(y1), r2=361(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 127
LDI r2, 361
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
