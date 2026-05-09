; DESCRIPTION: Renders a black line between points (382, 156) and (502, 246).
; PLAN: r0=382(x1), r1=156(y1), r2=502(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 156
LDI r2, 502
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
