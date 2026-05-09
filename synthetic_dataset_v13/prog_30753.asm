; DESCRIPTION: Renders a red line between points (502, 184) and (180, 245).
; PLAN: r0=502(x1), r1=184(y1), r2=180(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 184
LDI r2, 180
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
