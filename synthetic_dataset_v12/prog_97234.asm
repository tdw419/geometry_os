; DESCRIPTION: Renders a green line between points (301, 120) and (222, 14).
; PLAN: r0=301(x1), r1=120(y1), r2=222(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 120
LDI r2, 222
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
