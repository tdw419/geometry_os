; DESCRIPTION: Places a green line segment connecting (137, 172) to (96, 42).
; PLAN: r0=137(x1), r1=172(y1), r2=96(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 172
LDI r2, 96
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
