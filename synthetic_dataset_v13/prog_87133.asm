; DESCRIPTION: Draws a black line from (481, 249) to (179, 67).
; PLAN: r0=481(x1), r1=249(y1), r2=179(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 249
LDI r2, 179
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
