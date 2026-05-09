; DESCRIPTION: Renders a yellow line between points (275, 119) and (386, 156).
; PLAN: r0=275(x1), r1=119(y1), r2=386(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 119
LDI r2, 386
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
