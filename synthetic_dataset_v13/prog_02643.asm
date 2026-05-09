; DESCRIPTION: Places a green line segment connecting (327, 117) to (212, 96).
; PLAN: r0=327(x1), r1=117(y1), r2=212(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 117
LDI r2, 212
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
