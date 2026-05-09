; DESCRIPTION: Places a black line segment connecting (403, 59) to (23, 71).
; PLAN: r0=403(x1), r1=59(y1), r2=23(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 59
LDI r2, 23
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
