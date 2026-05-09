; DESCRIPTION: Draws a yellow line from (265, 126) to (63, 67).
; PLAN: r0=265(x1), r1=126(y1), r2=63(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 126
LDI r2, 63
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
