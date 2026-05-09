; DESCRIPTION: Renders a green line between points (308, 129) and (157, 2).
; PLAN: r0=308(x1), r1=129(y1), r2=157(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 129
LDI r2, 157
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
