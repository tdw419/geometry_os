; DESCRIPTION: Renders a cyan line between points (411, 142) and (74, 72).
; PLAN: r0=411(x1), r1=142(y1), r2=74(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 142
LDI r2, 74
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
