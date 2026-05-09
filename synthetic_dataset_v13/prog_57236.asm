; DESCRIPTION: Draws a yellow line from (67, 53) to (210, 12).
; PLAN: r0=67(x1), r1=53(y1), r2=210(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 53
LDI r2, 210
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
