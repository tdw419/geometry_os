; DESCRIPTION: Renders a cyan line between points (482, 136) and (161, 38).
; PLAN: r0=482(x1), r1=136(y1), r2=161(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 136
LDI r2, 161
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
