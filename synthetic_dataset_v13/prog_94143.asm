; DESCRIPTION: Renders a red line between points (149, 202) and (239, 94).
; PLAN: r0=149(x1), r1=202(y1), r2=239(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 202
LDI r2, 239
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
