; DESCRIPTION: Renders a cyan line between points (406, 175) and (417, 116).
; PLAN: r0=406(x1), r1=175(y1), r2=417(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 175
LDI r2, 417
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
