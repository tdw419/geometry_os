; DESCRIPTION: Places a blue line segment connecting (359, 116) to (502, 93).
; PLAN: r0=359(x1), r1=116(y1), r2=502(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 116
LDI r2, 502
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
