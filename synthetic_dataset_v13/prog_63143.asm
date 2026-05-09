; DESCRIPTION: Renders a black line between points (295, 25) and (297, 30).
; PLAN: r0=295(x1), r1=25(y1), r2=297(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 25
LDI r2, 297
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
