; DESCRIPTION: Renders a white line between points (116, 222) and (40, 32).
; PLAN: r0=116(x1), r1=222(y1), r2=40(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 222
LDI r2, 40
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
