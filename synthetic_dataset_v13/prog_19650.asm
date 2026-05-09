; DESCRIPTION: Places a orange line segment connecting (46, 42) to (124, 177).
; PLAN: r0=46(x1), r1=42(y1), r2=124(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 42
LDI r2, 124
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
