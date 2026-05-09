; DESCRIPTION: Places a black line segment connecting (437, 196) to (21, 172).
; PLAN: r0=437(x1), r1=196(y1), r2=21(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 196
LDI r2, 21
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
