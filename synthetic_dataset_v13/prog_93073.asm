; DESCRIPTION: Renders a cyan line between points (151, 161) and (103, 139).
; PLAN: r0=151(x1), r1=161(y1), r2=103(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 161
LDI r2, 103
LDI r3, 139
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
