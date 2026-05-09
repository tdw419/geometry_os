; DESCRIPTION: Draws a green line from (53, 56) to (501, 171).
; PLAN: r0=53(x1), r1=56(y1), r2=501(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 56
LDI r2, 501
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
