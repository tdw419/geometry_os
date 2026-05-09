; DESCRIPTION: Renders a cyan line between points (265, 158) and (231, 240).
; PLAN: r0=265(x1), r1=158(y1), r2=231(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 158
LDI r2, 231
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
