; DESCRIPTION: Renders a cyan line between points (84, 186) and (200, 226).
; PLAN: r0=84(x1), r1=186(y1), r2=200(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 186
LDI r2, 200
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
