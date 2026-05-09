; DESCRIPTION: Renders a yellow line between points (503, 145) and (218, 42).
; PLAN: r0=503(x1), r1=145(y1), r2=218(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 145
LDI r2, 218
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
