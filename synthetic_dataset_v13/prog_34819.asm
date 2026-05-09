; DESCRIPTION: Places a yellow line segment connecting (401, 161) to (211, 30).
; PLAN: r0=401(x1), r1=161(y1), r2=211(x2), r3=30(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 161
LDI r2, 211
LDI r3, 30
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
