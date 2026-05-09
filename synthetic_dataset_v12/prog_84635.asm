; DESCRIPTION: Places a black line segment connecting (0, 202) to (401, 33).
; PLAN: r0=0(x1), r1=202(y1), r2=401(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 202
LDI r2, 401
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
