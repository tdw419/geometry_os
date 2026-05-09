; DESCRIPTION: Renders a white line between points (167, 244) and (156, 234).
; PLAN: r0=167(x1), r1=244(y1), r2=156(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 244
LDI r2, 156
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
