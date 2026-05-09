; DESCRIPTION: Draws a yellow line from (67, 213) to (10, 73).
; PLAN: r0=67(x1), r1=213(y1), r2=10(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 213
LDI r2, 10
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
