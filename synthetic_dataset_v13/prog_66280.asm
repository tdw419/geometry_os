; DESCRIPTION: Renders a red line between points (138, 149) and (87, 214).
; PLAN: r0=138(x1), r1=149(y1), r2=87(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 149
LDI r2, 87
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
