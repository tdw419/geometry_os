; DESCRIPTION: Renders a white line between points (307, 148) and (17, 92).
; PLAN: r0=307(x1), r1=148(y1), r2=17(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 148
LDI r2, 17
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
