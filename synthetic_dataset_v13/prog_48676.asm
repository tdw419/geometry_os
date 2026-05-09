; DESCRIPTION: Renders a orange line between points (294, 8) and (156, 138).
; PLAN: r0=294(x1), r1=8(y1), r2=156(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 8
LDI r2, 156
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
