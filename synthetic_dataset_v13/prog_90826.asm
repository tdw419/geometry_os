; DESCRIPTION: Places a green line segment connecting (303, 221) to (385, 88).
; PLAN: r0=303(x1), r1=221(y1), r2=385(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 221
LDI r2, 385
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
