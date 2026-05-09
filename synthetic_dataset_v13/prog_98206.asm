; DESCRIPTION: Draws a white line from (63, 173) to (282, 58).
; PLAN: r0=63(x1), r1=173(y1), r2=282(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 173
LDI r2, 282
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
