; DESCRIPTION: Draws a green line from (178, 252) to (73, 134).
; PLAN: r0=178(x1), r1=252(y1), r2=73(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 252
LDI r2, 73
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
