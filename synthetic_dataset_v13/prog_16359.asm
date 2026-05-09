; DESCRIPTION: Draws a red line from (121, 56) to (128, 220).
; PLAN: r0=121(x1), r1=56(y1), r2=128(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 56
LDI r2, 128
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
