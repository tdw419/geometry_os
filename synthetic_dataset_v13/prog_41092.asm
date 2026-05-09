; DESCRIPTION: Places a yellow line segment connecting (70, 179) to (401, 34).
; PLAN: r0=70(x1), r1=179(y1), r2=401(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 179
LDI r2, 401
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
