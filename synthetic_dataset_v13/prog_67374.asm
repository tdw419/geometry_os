; DESCRIPTION: Places a magenta line segment connecting (303, 135) to (42, 82).
; PLAN: r0=303(x1), r1=135(y1), r2=42(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 135
LDI r2, 42
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
