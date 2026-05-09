; DESCRIPTION: Renders a red line between points (48, 226) and (509, 152).
; PLAN: r0=48(x1), r1=226(y1), r2=509(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 226
LDI r2, 509
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
