; DESCRIPTION: Renders a yellow line between points (168, 94) and (375, 198).
; PLAN: r0=168(x1), r1=94(y1), r2=375(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 94
LDI r2, 375
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
