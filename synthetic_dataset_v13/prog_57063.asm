; DESCRIPTION: Places a purple line segment connecting (81, 123) to (239, 42).
; PLAN: r0=81(x1), r1=123(y1), r2=239(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 123
LDI r2, 239
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
