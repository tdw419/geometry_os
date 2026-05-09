; DESCRIPTION: Draws a blue line from (191, 242) to (33, 204).
; PLAN: r0=191(x1), r1=242(y1), r2=33(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 242
LDI r2, 33
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
