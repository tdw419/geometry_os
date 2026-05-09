; DESCRIPTION: Renders a white line between points (337, 98) and (168, 105).
; PLAN: r0=337(x1), r1=98(y1), r2=168(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 98
LDI r2, 168
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
