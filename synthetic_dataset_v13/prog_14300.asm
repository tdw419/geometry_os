; DESCRIPTION: Renders a white line between points (491, 24) and (242, 230).
; PLAN: r0=491(x1), r1=24(y1), r2=242(x2), r3=230(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 24
LDI r2, 242
LDI r3, 230
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
