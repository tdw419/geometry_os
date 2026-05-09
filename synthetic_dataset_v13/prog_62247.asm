; DESCRIPTION: Renders a cyan line between points (28, 204) and (149, 75).
; PLAN: r0=28(x1), r1=204(y1), r2=149(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 204
LDI r2, 149
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
