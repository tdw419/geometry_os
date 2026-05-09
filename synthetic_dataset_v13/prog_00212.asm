; DESCRIPTION: Renders a yellow line between points (70, 166) and (39, 131).
; PLAN: r0=70(x1), r1=166(y1), r2=39(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 166
LDI r2, 39
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
