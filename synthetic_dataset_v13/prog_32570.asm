; DESCRIPTION: Renders a white line between points (335, 150) and (449, 223).
; PLAN: r0=335(x1), r1=150(y1), r2=449(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 150
LDI r2, 449
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
