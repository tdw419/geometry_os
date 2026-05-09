; DESCRIPTION: Renders a cyan line between points (38, 142) and (40, 60).
; PLAN: r0=38(x1), r1=142(y1), r2=40(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 142
LDI r2, 40
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
