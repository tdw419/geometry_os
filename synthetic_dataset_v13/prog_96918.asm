; DESCRIPTION: Renders a white line between points (333, 240) and (170, 109).
; PLAN: r0=333(x1), r1=240(y1), r2=170(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 240
LDI r2, 170
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
