; DESCRIPTION: Renders a blue line between points (208, 209) and (28, 115).
; PLAN: r0=208(x1), r1=209(y1), r2=28(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 209
LDI r2, 28
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
