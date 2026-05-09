; DESCRIPTION: Draws a green line from (135, 245) to (469, 88).
; PLAN: r0=135(x1), r1=245(y1), r2=469(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 245
LDI r2, 469
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
