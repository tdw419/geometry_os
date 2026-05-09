; DESCRIPTION: Places a blue line segment connecting (321, 209) to (49, 42).
; PLAN: r0=321(x1), r1=209(y1), r2=49(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 209
LDI r2, 49
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
