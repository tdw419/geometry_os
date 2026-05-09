; DESCRIPTION: Draws a green line from (412, 29) to (372, 51).
; PLAN: r0=412(x1), r1=29(y1), r2=372(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 29
LDI r2, 372
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
