; DESCRIPTION: Draws a black line from (214, 127) to (201, 60).
; PLAN: r0=214(x1), r1=127(y1), r2=201(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 127
LDI r2, 201
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
