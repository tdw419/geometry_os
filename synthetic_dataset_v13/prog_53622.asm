; DESCRIPTION: Renders a cyan line between points (181, 158) and (213, 148).
; PLAN: r0=181(x1), r1=158(y1), r2=213(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 158
LDI r2, 213
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
