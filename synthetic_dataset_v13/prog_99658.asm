; DESCRIPTION: Renders a cyan line between points (48, 158) and (74, 117).
; PLAN: r0=48(x1), r1=158(y1), r2=74(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 158
LDI r2, 74
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
