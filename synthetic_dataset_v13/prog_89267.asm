; DESCRIPTION: Places a blue line segment connecting (304, 109) to (290, 42).
; PLAN: r0=304(x1), r1=109(y1), r2=290(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 109
LDI r2, 290
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
