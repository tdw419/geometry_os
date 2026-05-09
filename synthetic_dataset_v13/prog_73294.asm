; DESCRIPTION: Places a white line segment connecting (412, 88) to (410, 148).
; PLAN: r0=412(x1), r1=88(y1), r2=410(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 88
LDI r2, 410
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
