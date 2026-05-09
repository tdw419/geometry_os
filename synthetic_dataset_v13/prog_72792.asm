; DESCRIPTION: Places a blue line segment connecting (346, 118) to (328, 42).
; PLAN: r0=346(x1), r1=118(y1), r2=328(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 118
LDI r2, 328
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
