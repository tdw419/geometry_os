; DESCRIPTION: Renders a white line between points (165, 43) and (498, 143).
; PLAN: r0=165(x1), r1=43(y1), r2=498(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 43
LDI r2, 498
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
