; DESCRIPTION: Places a green line segment connecting (25, 247) to (338, 180).
; PLAN: r0=25(x1), r1=247(y1), r2=338(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 247
LDI r2, 338
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
