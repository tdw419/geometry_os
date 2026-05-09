; DESCRIPTION: Draws a blue line from (261, 123) to (372, 27).
; PLAN: r0=261(x1), r1=123(y1), r2=372(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 123
LDI r2, 372
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
