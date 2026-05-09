; DESCRIPTION: Places a blue line segment connecting (271, 55) to (117, 146).
; PLAN: r0=271(x1), r1=55(y1), r2=117(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 55
LDI r2, 117
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
