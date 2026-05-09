; DESCRIPTION: Places a green line segment connecting (395, 73) to (160, 71).
; PLAN: r0=395(x1), r1=73(y1), r2=160(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 73
LDI r2, 160
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
