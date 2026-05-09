; DESCRIPTION: Renders a yellow line between points (206, 116) and (328, 67).
; PLAN: r0=206(x1), r1=116(y1), r2=328(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 116
LDI r2, 328
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
