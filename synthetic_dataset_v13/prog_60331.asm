; DESCRIPTION: Places a blue line segment connecting (202, 244) to (81, 113).
; PLAN: r0=202(x1), r1=244(y1), r2=81(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 244
LDI r2, 81
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
