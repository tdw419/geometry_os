; DESCRIPTION: Renders a cyan line between points (40, 8) and (482, 81).
; PLAN: r0=40(x1), r1=8(y1), r2=482(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 8
LDI r2, 482
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
