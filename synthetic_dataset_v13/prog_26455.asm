; DESCRIPTION: Renders a cyan line between points (19, 106) and (268, 115).
; PLAN: r0=19(x1), r1=106(y1), r2=268(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 106
LDI r2, 268
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
