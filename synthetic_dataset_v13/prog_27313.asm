; DESCRIPTION: Places a blue line segment connecting (410, 198) to (171, 52).
; PLAN: r0=410(x1), r1=198(y1), r2=171(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 198
LDI r2, 171
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
