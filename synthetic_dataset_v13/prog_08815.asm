; DESCRIPTION: Draws a green line from (11, 111) to (30, 69).
; PLAN: r0=11(x1), r1=111(y1), r2=30(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 111
LDI r2, 30
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
