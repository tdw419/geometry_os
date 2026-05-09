; DESCRIPTION: Draws a blue line from (150, 254) to (123, 57).
; PLAN: r0=150(x1), r1=254(y1), r2=123(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 254
LDI r2, 123
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
