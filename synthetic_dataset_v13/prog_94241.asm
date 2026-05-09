; DESCRIPTION: Renders a orange line between points (217, 81) and (198, 228).
; PLAN: r0=217(x1), r1=81(y1), r2=198(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 81
LDI r2, 198
LDI r3, 228
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
