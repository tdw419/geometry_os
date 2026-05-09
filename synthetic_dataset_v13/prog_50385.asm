; DESCRIPTION: Places a blue line segment connecting (21, 143) to (410, 31).
; PLAN: r0=21(x1), r1=143(y1), r2=410(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 143
LDI r2, 410
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
