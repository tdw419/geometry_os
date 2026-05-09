; DESCRIPTION: Places a red line segment connecting (267, 73) to (63, 42).
; PLAN: r0=267(x1), r1=73(y1), r2=63(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 73
LDI r2, 63
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
