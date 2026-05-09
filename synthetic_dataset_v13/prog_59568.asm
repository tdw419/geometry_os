; DESCRIPTION: Renders a yellow line between points (445, 61) and (108, 101).
; PLAN: r0=445(x1), r1=61(y1), r2=108(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 61
LDI r2, 108
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
