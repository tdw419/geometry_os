; DESCRIPTION: Places a black line segment connecting (401, 44) to (502, 22).
; PLAN: r0=401(x1), r1=44(y1), r2=502(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 44
LDI r2, 502
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
