; DESCRIPTION: Renders a green line between points (223, 67) and (11, 40).
; PLAN: r0=223(x1), r1=67(y1), r2=11(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 67
LDI r2, 11
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
