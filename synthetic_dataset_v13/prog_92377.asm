; DESCRIPTION: Places a yellow line segment connecting (234, 210) to (255, 135).
; PLAN: r0=234(x1), r1=210(y1), r2=255(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 210
LDI r2, 255
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
