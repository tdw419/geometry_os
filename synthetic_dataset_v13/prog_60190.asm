; DESCRIPTION: Draws a black line from (113, 114) to (67, 168).
; PLAN: r0=113(x1), r1=114(y1), r2=67(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 114
LDI r2, 67
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
