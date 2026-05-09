; DESCRIPTION: Places a magenta line segment connecting (209, 255) to (108, 9).
; PLAN: r0=209(x1), r1=255(y1), r2=108(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 255
LDI r2, 108
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
