; DESCRIPTION: Draws a green line from (218, 121) to (15, 249).
; PLAN: r0=218(x1), r1=121(y1), r2=15(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 121
LDI r2, 15
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
