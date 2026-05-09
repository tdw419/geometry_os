; DESCRIPTION: Draws a white line from (469, 63) to (202, 123).
; PLAN: r0=469(x1), r1=63(y1), r2=202(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 63
LDI r2, 202
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
