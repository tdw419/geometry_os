; DESCRIPTION: Renders a yellow line between points (74, 119) and (168, 215).
; PLAN: r0=74(x1), r1=119(y1), r2=168(x2), r3=215(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 119
LDI r2, 168
LDI r3, 215
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
