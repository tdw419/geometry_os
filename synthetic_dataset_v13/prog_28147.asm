; DESCRIPTION: Renders a red line between points (243, 249) and (108, 112).
; PLAN: r0=243(x1), r1=249(y1), r2=108(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 249
LDI r2, 108
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
