; DESCRIPTION: Renders a cyan line between points (376, 159) and (128, 97).
; PLAN: r0=376(x1), r1=159(y1), r2=128(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 159
LDI r2, 128
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
