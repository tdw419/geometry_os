; DESCRIPTION: Places a red line segment connecting (42, 229) to (267, 199).
; PLAN: r0=42(x1), r1=229(y1), r2=267(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 229
LDI r2, 267
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
