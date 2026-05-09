; DESCRIPTION: Renders a blue line between points (291, 218) and (479, 120).
; PLAN: r0=291(x1), r1=218(y1), r2=479(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 218
LDI r2, 479
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
