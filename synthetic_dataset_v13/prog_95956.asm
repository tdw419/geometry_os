; DESCRIPTION: Renders a white line between points (127, 172) and (465, 116).
; PLAN: r0=127(x1), r1=172(y1), r2=465(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 172
LDI r2, 465
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
