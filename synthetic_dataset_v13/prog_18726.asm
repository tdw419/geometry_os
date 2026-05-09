; DESCRIPTION: Renders a cyan line between points (4, 94) and (233, 108).
; PLAN: r0=4(x1), r1=94(y1), r2=233(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 94
LDI r2, 233
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
