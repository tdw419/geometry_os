; DESCRIPTION: Places a yellow line segment connecting (403, 28) to (494, 234).
; PLAN: r0=403(x1), r1=28(y1), r2=494(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 28
LDI r2, 494
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
