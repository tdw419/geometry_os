; DESCRIPTION: Places a yellow line segment connecting (262, 116) to (497, 42).
; PLAN: r0=262(x1), r1=116(y1), r2=497(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 116
LDI r2, 497
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
