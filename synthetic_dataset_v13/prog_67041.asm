; DESCRIPTION: Places a green line segment connecting (410, 198) to (175, 76).
; PLAN: r0=410(x1), r1=198(y1), r2=175(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 198
LDI r2, 175
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
