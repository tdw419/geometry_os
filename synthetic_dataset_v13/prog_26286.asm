; DESCRIPTION: Draws a green line from (339, 173) to (287, 26).
; PLAN: r0=339(x1), r1=173(y1), r2=287(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 173
LDI r2, 287
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
