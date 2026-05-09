; DESCRIPTION: Draws a green line from (60, 114) to (436, 67).
; PLAN: r0=60(x1), r1=114(y1), r2=436(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 114
LDI r2, 436
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
