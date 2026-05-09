; DESCRIPTION: Draws a red line from (332, 153) to (128, 44).
; PLAN: r0=332(x1), r1=153(y1), r2=128(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 153
LDI r2, 128
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
