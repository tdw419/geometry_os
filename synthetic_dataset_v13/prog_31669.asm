; DESCRIPTION: Renders a yellow line between points (439, 28) and (104, 143).
; PLAN: r0=439(x1), r1=28(y1), r2=104(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 28
LDI r2, 104
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
