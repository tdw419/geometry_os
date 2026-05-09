; DESCRIPTION: Renders a cyan line between points (65, 70) and (168, 158).
; PLAN: r0=65(x1), r1=70(y1), r2=168(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 70
LDI r2, 168
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
