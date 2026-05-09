; DESCRIPTION: Renders a green line between points (123, 116) and (254, 179).
; PLAN: r0=123(x1), r1=116(y1), r2=254(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 116
LDI r2, 254
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
