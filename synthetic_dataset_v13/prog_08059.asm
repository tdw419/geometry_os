; DESCRIPTION: Renders a cyan line between points (149, 83) and (189, 32).
; PLAN: r0=149(x1), r1=83(y1), r2=189(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 83
LDI r2, 189
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
