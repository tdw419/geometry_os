; DESCRIPTION: Draws a green line from (163, 67) to (24, 177).
; PLAN: r0=163(x1), r1=67(y1), r2=24(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 67
LDI r2, 24
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
