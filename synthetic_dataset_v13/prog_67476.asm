; DESCRIPTION: Draws a green line from (128, 116) to (211, 112).
; PLAN: r0=128(x1), r1=116(y1), r2=211(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 116
LDI r2, 211
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
