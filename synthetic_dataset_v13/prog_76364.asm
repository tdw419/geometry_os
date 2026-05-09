; DESCRIPTION: Draws a green line from (64, 39) to (411, 88).
; PLAN: r0=64(x1), r1=39(y1), r2=411(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 39
LDI r2, 411
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
