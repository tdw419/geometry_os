; DESCRIPTION: Renders a yellow line between points (294, 124) and (304, 120).
; PLAN: r0=294(x1), r1=124(y1), r2=304(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 124
LDI r2, 304
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
