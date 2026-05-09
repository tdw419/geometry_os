; DESCRIPTION: Renders a orange line between points (98, 102) and (384, 150).
; PLAN: r0=98(x1), r1=102(y1), r2=384(x2), r3=150(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 102
LDI r2, 384
LDI r3, 150
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
