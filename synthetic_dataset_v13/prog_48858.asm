; DESCRIPTION: Renders a red line between points (296, 129) and (200, 32).
; PLAN: r0=296(x1), r1=129(y1), r2=200(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 129
LDI r2, 200
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
