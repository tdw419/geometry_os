; DESCRIPTION: Draws a black line from (236, 214) to (370, 103).
; PLAN: r0=236(x1), r1=214(y1), r2=370(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 214
LDI r2, 370
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
