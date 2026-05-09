; DESCRIPTION: Places a green line segment connecting (410, 184) to (245, 1).
; PLAN: r0=410(x1), r1=184(y1), r2=245(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 184
LDI r2, 245
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
