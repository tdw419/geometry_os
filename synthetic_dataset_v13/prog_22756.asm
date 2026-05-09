; DESCRIPTION: Renders a orange line between points (444, 64) and (67, 126).
; PLAN: r0=444(x1), r1=64(y1), r2=67(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 64
LDI r2, 67
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
