; DESCRIPTION: Renders a yellow line between points (281, 2) and (411, 167).
; PLAN: r0=281(x1), r1=2(y1), r2=411(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 2
LDI r2, 411
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
