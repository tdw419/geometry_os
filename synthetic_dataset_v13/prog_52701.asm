; DESCRIPTION: Draws a red line from (411, 103) to (175, 128).
; PLAN: r0=411(x1), r1=103(y1), r2=175(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 103
LDI r2, 175
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
