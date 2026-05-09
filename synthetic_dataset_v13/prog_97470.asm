; DESCRIPTION: Renders a cyan line between points (336, 41) and (256, 163).
; PLAN: r0=336(x1), r1=41(y1), r2=256(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 41
LDI r2, 256
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
