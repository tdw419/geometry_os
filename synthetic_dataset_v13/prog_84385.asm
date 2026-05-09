; DESCRIPTION: Places a magenta line segment connecting (263, 79) to (187, 41).
; PLAN: r0=263(x1), r1=79(y1), r2=187(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 79
LDI r2, 187
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
