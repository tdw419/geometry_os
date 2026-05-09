; DESCRIPTION: Places a cyan line segment connecting (128, 209) to (337, 20).
; PLAN: r0=128(x1), r1=209(y1), r2=337(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 209
LDI r2, 337
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
