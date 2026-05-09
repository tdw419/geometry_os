; DESCRIPTION: Renders a cyan line between points (424, 115) and (255, 99).
; PLAN: r0=424(x1), r1=115(y1), r2=255(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 115
LDI r2, 255
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
