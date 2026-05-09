; DESCRIPTION: Places a orange line segment connecting (72, 82) to (228, 109).
; PLAN: r0=72(x1), r1=82(y1), r2=228(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 82
LDI r2, 228
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
