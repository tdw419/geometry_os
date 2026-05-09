; DESCRIPTION: Places a purple circle of radius 20 at center (146, 121).
; PLAN: r0=146(x), r1=121(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 121
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
