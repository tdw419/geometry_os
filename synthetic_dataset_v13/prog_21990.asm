; DESCRIPTION: Places a green line segment connecting (192, 236) to (215, 224).
; PLAN: r0=192(x1), r1=236(y1), r2=215(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 236
LDI r2, 215
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
