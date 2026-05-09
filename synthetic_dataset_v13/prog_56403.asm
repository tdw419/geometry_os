; DESCRIPTION: Renders a green line between points (63, 46) and (505, 27).
; PLAN: r0=63(x1), r1=46(y1), r2=505(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 46
LDI r2, 505
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
