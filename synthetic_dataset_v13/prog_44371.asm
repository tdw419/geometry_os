; DESCRIPTION: Draws a green line from (469, 24) to (265, 33).
; PLAN: r0=469(x1), r1=24(y1), r2=265(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 24
LDI r2, 265
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
