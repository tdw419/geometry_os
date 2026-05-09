; DESCRIPTION: Draws a black line from (123, 68) to (402, 134).
; PLAN: r0=123(x1), r1=68(y1), r2=402(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 68
LDI r2, 402
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
