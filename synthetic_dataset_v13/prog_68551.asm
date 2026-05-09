; DESCRIPTION: Draws a green line from (388, 173) to (51, 254).
; PLAN: r0=388(x1), r1=173(y1), r2=51(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 173
LDI r2, 51
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
