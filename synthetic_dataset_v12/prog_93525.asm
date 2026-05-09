; DESCRIPTION: Renders a white line between points (60, 163) and (291, 198).
; PLAN: r0=60(x1), r1=163(y1), r2=291(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 163
LDI r2, 291
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
