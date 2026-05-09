; DESCRIPTION: Places a cyan line segment connecting (25, 178) to (227, 52).
; PLAN: r0=25(x1), r1=178(y1), r2=227(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 178
LDI r2, 227
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
