; DESCRIPTION: Renders a red line between points (213, 79) and (11, 172).
; PLAN: r0=213(x1), r1=79(y1), r2=11(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 79
LDI r2, 11
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
