; DESCRIPTION: Draws a green line from (151, 230) to (333, 22).
; PLAN: r0=151(x1), r1=230(y1), r2=333(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 230
LDI r2, 333
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
