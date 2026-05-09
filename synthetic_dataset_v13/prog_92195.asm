; DESCRIPTION: Renders a black line between points (445, 2) and (421, 163).
; PLAN: r0=445(x1), r1=2(y1), r2=421(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 2
LDI r2, 421
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
