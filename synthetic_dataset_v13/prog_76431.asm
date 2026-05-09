; DESCRIPTION: Renders a orange line between points (446, 120) and (340, 52).
; PLAN: r0=446(x1), r1=120(y1), r2=340(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 120
LDI r2, 340
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
