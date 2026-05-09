; DESCRIPTION: Draws a yellow line from (262, 63) to (115, 28).
; PLAN: r0=262(x1), r1=63(y1), r2=115(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 63
LDI r2, 115
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
