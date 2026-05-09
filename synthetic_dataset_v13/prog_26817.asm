; DESCRIPTION: Draws a blue line from (168, 13) to (259, 103).
; PLAN: r0=168(x1), r1=13(y1), r2=259(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 13
LDI r2, 259
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
