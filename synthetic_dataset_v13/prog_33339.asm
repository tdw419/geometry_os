; DESCRIPTION: Draws a yellow line from (304, 143) to (504, 4).
; PLAN: r0=304(x1), r1=143(y1), r2=504(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 143
LDI r2, 504
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
