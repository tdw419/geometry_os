; DESCRIPTION: Renders a green line between points (173, 156) and (254, 146).
; PLAN: r0=173(x1), r1=156(y1), r2=254(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 156
LDI r2, 254
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
