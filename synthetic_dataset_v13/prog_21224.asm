; DESCRIPTION: Places a orange line segment connecting (267, 186) to (187, 73).
; PLAN: r0=267(x1), r1=186(y1), r2=187(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 186
LDI r2, 187
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
