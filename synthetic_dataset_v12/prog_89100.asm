; DESCRIPTION: Renders a cyan line between points (87, 113) and (22, 12).
; PLAN: r0=87(x1), r1=113(y1), r2=22(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 113
LDI r2, 22
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
