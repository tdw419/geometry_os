; DESCRIPTION: Renders a blue line between points (281, 60) and (411, 246).
; PLAN: r0=281(x1), r1=60(y1), r2=411(x2), r3=246(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 60
LDI r2, 411
LDI r3, 246
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
