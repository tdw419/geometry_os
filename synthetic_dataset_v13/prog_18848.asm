; DESCRIPTION: Renders a red line between points (213, 109) and (176, 48).
; PLAN: r0=213(x1), r1=109(y1), r2=176(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 109
LDI r2, 176
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
