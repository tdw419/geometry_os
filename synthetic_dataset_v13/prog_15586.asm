; DESCRIPTION: Draws a green line from (403, 246) to (161, 151).
; PLAN: r0=403(x1), r1=246(y1), r2=161(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 246
LDI r2, 161
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
