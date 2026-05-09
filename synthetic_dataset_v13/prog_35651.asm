; DESCRIPTION: Places a cyan line segment connecting (435, 224) to (16, 136).
; PLAN: r0=435(x1), r1=224(y1), r2=16(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 224
LDI r2, 16
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
