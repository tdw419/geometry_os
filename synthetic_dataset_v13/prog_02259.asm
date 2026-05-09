; DESCRIPTION: Renders a orange line between points (443, 239) and (115, 59).
; PLAN: r0=443(x1), r1=239(y1), r2=115(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 239
LDI r2, 115
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
