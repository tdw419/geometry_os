; DESCRIPTION: Draws a black line from (437, 101) to (218, 150).
; PLAN: r0=437(x1), r1=101(y1), r2=218(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 101
LDI r2, 218
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
