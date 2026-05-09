; DESCRIPTION: Draws a green line from (40, 213) to (469, 28).
; PLAN: r0=40(x1), r1=213(y1), r2=469(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 213
LDI r2, 469
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
