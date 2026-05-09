; DESCRIPTION: Draws a green line from (181, 132) to (113, 73).
; PLAN: r0=181(x1), r1=132(y1), r2=113(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 132
LDI r2, 113
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
