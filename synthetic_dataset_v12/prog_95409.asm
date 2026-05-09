; DESCRIPTION: Renders a cyan line between points (125, 158) and (364, 228).
; PLAN: r0=125(x1), r1=158(y1), r2=364(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 158
LDI r2, 364
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
