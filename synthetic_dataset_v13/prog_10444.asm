; DESCRIPTION: Draws a green line from (72, 214) to (218, 30).
; PLAN: r0=72(x1), r1=214(y1), r2=218(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 214
LDI r2, 218
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
