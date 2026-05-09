; DESCRIPTION: Draws a green line from (367, 151) to (333, 252).
; PLAN: r0=367(x1), r1=151(y1), r2=333(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 151
LDI r2, 333
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
