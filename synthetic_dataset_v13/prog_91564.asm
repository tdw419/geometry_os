; DESCRIPTION: Draws a yellow line from (82, 109) to (434, 133).
; PLAN: r0=82(x1), r1=109(y1), r2=434(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 109
LDI r2, 434
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
