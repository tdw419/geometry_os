; DESCRIPTION: Renders a yellow line between points (216, 70) and (354, 108).
; PLAN: r0=216(x1), r1=70(y1), r2=354(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 70
LDI r2, 354
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
