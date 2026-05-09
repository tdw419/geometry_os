; DESCRIPTION: Renders a white line between points (168, 233) and (406, 204).
; PLAN: r0=168(x1), r1=233(y1), r2=406(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 233
LDI r2, 406
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
