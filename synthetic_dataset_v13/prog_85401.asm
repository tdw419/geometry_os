; DESCRIPTION: Renders a red line between points (396, 126) and (317, 86).
; PLAN: r0=396(x1), r1=126(y1), r2=317(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 126
LDI r2, 317
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
