; DESCRIPTION: Renders a black line between points (231, 215) and (336, 255).
; PLAN: r0=231(x1), r1=215(y1), r2=336(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 215
LDI r2, 336
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
