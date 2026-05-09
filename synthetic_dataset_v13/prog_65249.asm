; DESCRIPTION: Renders a green line between points (184, 189) and (104, 143).
; PLAN: r0=184(x1), r1=189(y1), r2=104(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 189
LDI r2, 104
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
