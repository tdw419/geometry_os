; DESCRIPTION: Renders a green line between points (458, 1) and (446, 60).
; PLAN: r0=458(x1), r1=1(y1), r2=446(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 1
LDI r2, 446
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
