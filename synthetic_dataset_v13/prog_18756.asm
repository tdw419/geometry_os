; DESCRIPTION: Renders a cyan line between points (32, 100) and (482, 106).
; PLAN: r0=32(x1), r1=100(y1), r2=482(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 100
LDI r2, 482
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
