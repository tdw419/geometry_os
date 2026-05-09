; DESCRIPTION: Draws a green line from (406, 92) to (265, 207).
; PLAN: r0=406(x1), r1=92(y1), r2=265(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 92
LDI r2, 265
LDI r3, 207
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
