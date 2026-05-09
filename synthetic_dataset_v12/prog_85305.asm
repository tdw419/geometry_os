; DESCRIPTION: Places a green line segment connecting (215, 113) to (349, 189).
; PLAN: r0=215(x1), r1=113(y1), r2=349(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 113
LDI r2, 349
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
