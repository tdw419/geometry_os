; DESCRIPTION: Draws a green line from (119, 208) to (421, 117).
; PLAN: r0=119(x1), r1=208(y1), r2=421(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 208
LDI r2, 421
LDI r3, 117
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
