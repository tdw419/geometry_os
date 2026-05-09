; DESCRIPTION: Renders a cyan line between points (23, 131) and (149, 129).
; PLAN: r0=23(x1), r1=131(y1), r2=149(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 131
LDI r2, 149
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
