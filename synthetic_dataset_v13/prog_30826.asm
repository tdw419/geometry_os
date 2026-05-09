; DESCRIPTION: Renders a cyan line between points (149, 64) and (27, 53).
; PLAN: r0=149(x1), r1=64(y1), r2=27(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 64
LDI r2, 27
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
