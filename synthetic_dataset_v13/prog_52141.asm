; DESCRIPTION: Renders a white line between points (304, 29) and (168, 77).
; PLAN: r0=304(x1), r1=29(y1), r2=168(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 29
LDI r2, 168
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
