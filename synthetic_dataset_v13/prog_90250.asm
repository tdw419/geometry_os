; DESCRIPTION: Places a cyan line segment connecting (329, 142) to (14, 13).
; PLAN: r0=329(x1), r1=142(y1), r2=14(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 142
LDI r2, 14
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
