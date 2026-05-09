; DESCRIPTION: Renders a yellow line between points (478, 189) and (434, 228).
; PLAN: r0=478(x1), r1=189(y1), r2=434(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 189
LDI r2, 434
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
