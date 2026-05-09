; DESCRIPTION: Renders a green line between points (116, 41) and (128, 7).
; PLAN: r0=116(x1), r1=41(y1), r2=128(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 41
LDI r2, 128
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
