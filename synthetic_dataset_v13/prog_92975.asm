; DESCRIPTION: Renders a red line between points (68, 233) and (502, 40).
; PLAN: r0=68(x1), r1=233(y1), r2=502(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 233
LDI r2, 502
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
