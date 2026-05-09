; DESCRIPTION: Places a yellow line segment connecting (210, 184) to (187, 95).
; PLAN: r0=210(x1), r1=184(y1), r2=187(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 184
LDI r2, 187
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
