; DESCRIPTION: Renders a cyan line between points (85, 227) and (128, 213).
; PLAN: r0=85(x1), r1=227(y1), r2=128(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 227
LDI r2, 128
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
