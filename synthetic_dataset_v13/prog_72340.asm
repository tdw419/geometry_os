; DESCRIPTION: Places a purple line segment connecting (187, 233) to (88, 27).
; PLAN: r0=187(x1), r1=233(y1), r2=88(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 233
LDI r2, 88
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
