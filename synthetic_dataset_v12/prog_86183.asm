; DESCRIPTION: Draws a green line from (278, 187) to (304, 95).
; PLAN: r0=278(x1), r1=187(y1), r2=304(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 187
LDI r2, 304
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
