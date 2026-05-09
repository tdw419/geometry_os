; DESCRIPTION: Places a purple line segment connecting (466, 10) to (154, 42).
; PLAN: r0=466(x1), r1=10(y1), r2=154(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 10
LDI r2, 154
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
