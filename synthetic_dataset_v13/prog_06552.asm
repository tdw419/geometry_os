; DESCRIPTION: Renders a cyan line between points (86, 59) and (55, 205).
; PLAN: r0=86(x1), r1=59(y1), r2=55(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 59
LDI r2, 55
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
