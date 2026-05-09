; DESCRIPTION: Renders a red line between points (336, 94) and (236, 215).
; PLAN: r0=336(x1), r1=94(y1), r2=236(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 94
LDI r2, 236
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
