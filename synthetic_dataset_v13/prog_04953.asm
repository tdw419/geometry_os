; DESCRIPTION: Places a black line segment connecting (288, 149) to (33, 182).
; PLAN: r0=288(x1), r1=149(y1), r2=33(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 149
LDI r2, 33
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
