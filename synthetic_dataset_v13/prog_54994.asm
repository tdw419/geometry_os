; DESCRIPTION: Draws a green line from (259, 173) to (327, 98).
; PLAN: r0=259(x1), r1=173(y1), r2=327(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 173
LDI r2, 327
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
