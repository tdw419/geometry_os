; DESCRIPTION: Renders a orange line between points (283, 95) and (281, 128).
; PLAN: r0=283(x1), r1=95(y1), r2=281(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 95
LDI r2, 281
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
