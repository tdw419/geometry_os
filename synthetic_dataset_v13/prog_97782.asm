; DESCRIPTION: Places a blue line segment connecting (410, 115) to (69, 43).
; PLAN: r0=410(x1), r1=115(y1), r2=69(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 115
LDI r2, 69
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
