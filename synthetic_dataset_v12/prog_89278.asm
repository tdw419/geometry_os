; DESCRIPTION: Places a cyan line segment connecting (128, 161) to (509, 17).
; PLAN: r0=128(x1), r1=161(y1), r2=509(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 161
LDI r2, 509
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
