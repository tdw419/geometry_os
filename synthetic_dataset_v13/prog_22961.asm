; DESCRIPTION: Renders a cyan line between points (202, 84) and (462, 255).
; PLAN: r0=202(x1), r1=84(y1), r2=462(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 84
LDI r2, 462
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
