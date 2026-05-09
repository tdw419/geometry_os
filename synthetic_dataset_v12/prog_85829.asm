; DESCRIPTION: Places a green line segment connecting (291, 55) to (393, 172).
; PLAN: r0=291(x1), r1=55(y1), r2=393(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 55
LDI r2, 393
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
