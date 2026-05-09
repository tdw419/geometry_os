; DESCRIPTION: Places a cyan line segment connecting (78, 222) to (32, 124).
; PLAN: r0=78(x1), r1=222(y1), r2=32(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 222
LDI r2, 32
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
