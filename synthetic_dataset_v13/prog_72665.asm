; DESCRIPTION: Places a green line segment connecting (328, 250) to (215, 178).
; PLAN: r0=328(x1), r1=250(y1), r2=215(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 250
LDI r2, 215
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
