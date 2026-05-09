; DESCRIPTION: Renders a white line between points (363, 59) and (458, 160).
; PLAN: r0=363(x1), r1=59(y1), r2=458(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 59
LDI r2, 458
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
