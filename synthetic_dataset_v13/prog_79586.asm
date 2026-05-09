; DESCRIPTION: Renders a blue line between points (324, 207) and (33, 209).
; PLAN: r0=324(x1), r1=207(y1), r2=33(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 207
LDI r2, 33
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
