; DESCRIPTION: Renders a cyan line between points (109, 5) and (456, 26).
; PLAN: r0=109(x1), r1=5(y1), r2=456(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 5
LDI r2, 456
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
