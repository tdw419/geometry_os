; DESCRIPTION: Draws a blue line from (450, 72) to (297, 204).
; PLAN: r0=450(x1), r1=72(y1), r2=297(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 72
LDI r2, 297
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
