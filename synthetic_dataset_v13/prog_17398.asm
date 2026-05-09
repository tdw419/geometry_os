; DESCRIPTION: Renders a green line between points (288, 19) and (233, 164).
; PLAN: r0=288(x1), r1=19(y1), r2=233(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 19
LDI r2, 233
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
