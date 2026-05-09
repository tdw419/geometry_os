; DESCRIPTION: Renders a red line between points (67, 58) and (63, 128).
; PLAN: r0=67(x1), r1=58(y1), r2=63(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 58
LDI r2, 63
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
