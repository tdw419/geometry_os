; DESCRIPTION: Draws a magenta line from (282, 209) to (115, 21).
; PLAN: r0=282(x1), r1=209(y1), r2=115(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 209
LDI r2, 115
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
