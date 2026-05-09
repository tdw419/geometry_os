; DESCRIPTION: Places a cyan line segment connecting (331, 136) to (128, 154).
; PLAN: r0=331(x1), r1=136(y1), r2=128(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 136
LDI r2, 128
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
