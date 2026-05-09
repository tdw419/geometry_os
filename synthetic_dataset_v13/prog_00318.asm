; DESCRIPTION: Draws a black line from (116, 67) to (237, 103).
; PLAN: r0=116(x1), r1=67(y1), r2=237(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 67
LDI r2, 237
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
