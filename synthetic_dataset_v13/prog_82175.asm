; DESCRIPTION: Places a cyan line segment connecting (260, 212) to (224, 136).
; PLAN: r0=260(x1), r1=212(y1), r2=224(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 212
LDI r2, 224
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
