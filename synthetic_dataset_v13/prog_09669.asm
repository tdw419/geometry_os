; DESCRIPTION: Draws a green line from (67, 116) to (262, 158).
; PLAN: r0=67(x1), r1=116(y1), r2=262(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 116
LDI r2, 262
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
