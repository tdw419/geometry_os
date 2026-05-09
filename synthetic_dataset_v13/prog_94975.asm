; DESCRIPTION: Renders a red line between points (27, 171) and (278, 126).
; PLAN: r0=27(x1), r1=171(y1), r2=278(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 171
LDI r2, 278
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
