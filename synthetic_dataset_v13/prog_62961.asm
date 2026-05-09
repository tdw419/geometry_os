; DESCRIPTION: Renders a cyan line between points (74, 33) and (184, 105).
; PLAN: r0=74(x1), r1=33(y1), r2=184(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 33
LDI r2, 184
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
