; DESCRIPTION: Places a yellow line segment connecting (410, 92) to (386, 180).
; PLAN: r0=410(x1), r1=92(y1), r2=386(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 92
LDI r2, 386
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
