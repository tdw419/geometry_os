; DESCRIPTION: Renders a red line between points (509, 29) and (48, 198).
; PLAN: r0=509(x1), r1=29(y1), r2=48(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 29
LDI r2, 48
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
