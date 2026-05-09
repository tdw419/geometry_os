; DESCRIPTION: Draws a green line from (506, 222) to (469, 30).
; PLAN: r0=506(x1), r1=222(y1), r2=469(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 222
LDI r2, 469
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
