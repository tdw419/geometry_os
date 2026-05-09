; DESCRIPTION: Renders a cyan line between points (336, 57) and (215, 244).
; PLAN: r0=336(x1), r1=57(y1), r2=215(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 57
LDI r2, 215
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
