; DESCRIPTION: Renders a green line between points (213, 172) and (165, 245).
; PLAN: r0=213(x1), r1=172(y1), r2=165(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 172
LDI r2, 165
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
