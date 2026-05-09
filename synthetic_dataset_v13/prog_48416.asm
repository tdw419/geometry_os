; DESCRIPTION: Renders a red line between points (70, 243) and (493, 184).
; PLAN: r0=70(x1), r1=243(y1), r2=493(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 243
LDI r2, 493
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
