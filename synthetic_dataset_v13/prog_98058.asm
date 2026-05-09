; DESCRIPTION: Renders a green line between points (314, 111) and (480, 3).
; PLAN: r0=314(x1), r1=111(y1), r2=480(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 111
LDI r2, 480
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
