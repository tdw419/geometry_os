; DESCRIPTION: Places a cyan line segment connecting (25, 222) to (169, 184).
; PLAN: r0=25(x1), r1=222(y1), r2=169(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 222
LDI r2, 169
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
