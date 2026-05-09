; DESCRIPTION: Draws a cyan line from (128, 144) to (76, 109).
; PLAN: r0=128(x1), r1=144(y1), r2=76(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 144
LDI r2, 76
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
