; DESCRIPTION: Renders a yellow line between points (380, 180) and (336, 128).
; PLAN: r0=380(x1), r1=180(y1), r2=336(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 180
LDI r2, 336
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
