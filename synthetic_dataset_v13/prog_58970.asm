; DESCRIPTION: Renders a red line between points (38, 224) and (243, 238).
; PLAN: r0=38(x1), r1=224(y1), r2=243(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 224
LDI r2, 243
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
