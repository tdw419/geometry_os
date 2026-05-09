; DESCRIPTION: Renders a green line between points (457, 223) and (458, 197).
; PLAN: r0=457(x1), r1=223(y1), r2=458(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 223
LDI r2, 458
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
