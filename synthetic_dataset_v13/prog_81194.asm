; DESCRIPTION: Places a magenta line segment connecting (352, 34) to (394, 6).
; PLAN: r0=352(x1), r1=34(y1), r2=394(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 34
LDI r2, 394
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
