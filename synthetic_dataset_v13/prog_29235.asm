; DESCRIPTION: Renders a blue line between points (479, 226) and (260, 65).
; PLAN: r0=479(x1), r1=226(y1), r2=260(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 226
LDI r2, 260
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
