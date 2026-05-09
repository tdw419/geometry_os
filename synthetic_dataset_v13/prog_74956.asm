; DESCRIPTION: Places a green line segment connecting (288, 28) to (492, 6).
; PLAN: r0=288(x1), r1=28(y1), r2=492(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 28
LDI r2, 492
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
