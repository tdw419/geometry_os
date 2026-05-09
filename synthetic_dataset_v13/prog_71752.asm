; DESCRIPTION: Draws a green line from (50, 176) to (33, 74).
; PLAN: r0=50(x1), r1=176(y1), r2=33(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 176
LDI r2, 33
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
