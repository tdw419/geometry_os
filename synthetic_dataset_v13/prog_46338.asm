; DESCRIPTION: Renders a green line between points (499, 230) and (216, 180).
; PLAN: r0=499(x1), r1=230(y1), r2=216(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 230
LDI r2, 216
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
