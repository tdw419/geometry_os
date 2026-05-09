; DESCRIPTION: Places a green line segment connecting (360, 111) to (6, 38).
; PLAN: r0=360(x1), r1=111(y1), r2=6(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 111
LDI r2, 6
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
