; DESCRIPTION: Places a blue line segment connecting (493, 22) to (154, 42).
; PLAN: r0=493(x1), r1=22(y1), r2=154(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 22
LDI r2, 154
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
