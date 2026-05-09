; DESCRIPTION: Renders a cyan line between points (55, 68) and (80, 156).
; PLAN: r0=55(x1), r1=68(y1), r2=80(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 68
LDI r2, 80
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
