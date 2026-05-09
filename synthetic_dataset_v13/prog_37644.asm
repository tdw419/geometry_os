; DESCRIPTION: Places a white line segment connecting (21, 64) to (301, 193).
; PLAN: r0=21(x1), r1=64(y1), r2=301(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 64
LDI r2, 301
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
