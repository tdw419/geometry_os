; DESCRIPTION: Places a blue line segment connecting (394, 154) to (264, 252).
; PLAN: r0=394(x1), r1=154(y1), r2=264(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 154
LDI r2, 264
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
