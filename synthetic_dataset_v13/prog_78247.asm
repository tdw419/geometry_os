; DESCRIPTION: Places a green line segment connecting (446, 47) to (122, 28).
; PLAN: r0=446(x1), r1=47(y1), r2=122(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 47
LDI r2, 122
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
