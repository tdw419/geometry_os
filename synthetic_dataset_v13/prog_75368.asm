; DESCRIPTION: Draws a purple line from (154, 23) to (464, 0).
; PLAN: r0=154(x1), r1=23(y1), r2=464(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 23
LDI r2, 464
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
