; DESCRIPTION: Draws a cyan line from (128, 31) to (324, 179).
; PLAN: r0=128(x1), r1=31(y1), r2=324(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 31
LDI r2, 324
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
