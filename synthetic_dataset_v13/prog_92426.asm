; DESCRIPTION: Draws a green line from (183, 176) to (230, 78).
; PLAN: r0=183(x1), r1=176(y1), r2=230(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 176
LDI r2, 230
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
