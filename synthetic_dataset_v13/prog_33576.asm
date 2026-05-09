; DESCRIPTION: Renders a white line between points (449, 212) and (180, 223).
; PLAN: r0=449(x1), r1=212(y1), r2=180(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 212
LDI r2, 180
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
