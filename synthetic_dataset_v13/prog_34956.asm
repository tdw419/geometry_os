; DESCRIPTION: Places a purple line segment connecting (402, 154) to (348, 228).
; PLAN: r0=402(x1), r1=154(y1), r2=348(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 154
LDI r2, 348
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
