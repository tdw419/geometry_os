; DESCRIPTION: Places a green line segment connecting (189, 251) to (215, 198).
; PLAN: r0=189(x1), r1=251(y1), r2=215(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 251
LDI r2, 215
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
