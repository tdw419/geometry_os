; DESCRIPTION: Draws a red line from (240, 58) to (128, 192).
; PLAN: r0=240(x1), r1=58(y1), r2=128(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 58
LDI r2, 128
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
