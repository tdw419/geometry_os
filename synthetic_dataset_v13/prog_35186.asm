; DESCRIPTION: Draws a yellow line from (67, 138) to (279, 126).
; PLAN: r0=67(x1), r1=138(y1), r2=279(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 138
LDI r2, 279
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
