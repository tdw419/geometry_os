; DESCRIPTION: Renders a red line between points (261, 221) and (259, 32).
; PLAN: r0=261(x1), r1=221(y1), r2=259(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 221
LDI r2, 259
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
