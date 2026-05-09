; DESCRIPTION: Draws a blue line from (43, 253) to (464, 45).
; PLAN: r0=43(x1), r1=253(y1), r2=464(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 253
LDI r2, 464
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
