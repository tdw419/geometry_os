; DESCRIPTION: Draws a orange line from (58, 126) to (148, 113).
; PLAN: r0=58(x1), r1=126(y1), r2=148(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 126
LDI r2, 148
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
