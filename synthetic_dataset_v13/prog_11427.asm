; DESCRIPTION: Renders a blue line between points (242, 39) and (459, 5).
; PLAN: r0=242(x1), r1=39(y1), r2=459(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 39
LDI r2, 459
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
