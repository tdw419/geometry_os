; DESCRIPTION: Renders a cyan line between points (1, 124) and (156, 100).
; PLAN: r0=1(x1), r1=124(y1), r2=156(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 124
LDI r2, 156
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
