; DESCRIPTION: Draws a green line from (56, 67) to (116, 115).
; PLAN: r0=56(x1), r1=67(y1), r2=116(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 67
LDI r2, 116
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
