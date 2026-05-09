; DESCRIPTION: Renders a red line between points (336, 32) and (28, 86).
; PLAN: r0=336(x1), r1=32(y1), r2=28(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 32
LDI r2, 28
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
