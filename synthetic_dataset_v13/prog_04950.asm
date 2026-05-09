; DESCRIPTION: Renders a green line between points (34, 129) and (418, 52).
; PLAN: r0=34(x1), r1=129(y1), r2=418(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 129
LDI r2, 418
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
