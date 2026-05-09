; DESCRIPTION: Places a cyan line segment connecting (66, 252) to (291, 196).
; PLAN: r0=66(x1), r1=252(y1), r2=291(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 252
LDI r2, 291
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
