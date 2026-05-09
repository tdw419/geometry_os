; DESCRIPTION: Places a cyan line segment connecting (417, 2) to (128, 101).
; PLAN: r0=417(x1), r1=2(y1), r2=128(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 2
LDI r2, 128
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
