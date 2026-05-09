; DESCRIPTION: Places a magenta line segment connecting (42, 82) to (41, 163).
; PLAN: r0=42(x1), r1=82(y1), r2=41(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 82
LDI r2, 41
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
