; DESCRIPTION: Draws a yellow line from (284, 200) to (483, 249).
; PLAN: r0=284(x1), r1=200(y1), r2=483(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 200
LDI r2, 483
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
