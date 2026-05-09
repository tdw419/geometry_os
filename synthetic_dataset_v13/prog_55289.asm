; DESCRIPTION: Renders a yellow line between points (229, 156) and (263, 143).
; PLAN: r0=229(x1), r1=156(y1), r2=263(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 156
LDI r2, 263
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
