; DESCRIPTION: Places a blue line segment connecting (479, 77) to (503, 243).
; PLAN: r0=479(x1), r1=77(y1), r2=503(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 77
LDI r2, 503
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
