; DESCRIPTION: Places a blue line segment connecting (288, 32) to (174, 42).
; PLAN: r0=288(x1), r1=32(y1), r2=174(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 32
LDI r2, 174
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
