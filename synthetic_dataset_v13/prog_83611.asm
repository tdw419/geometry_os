; DESCRIPTION: Creates a purple circular shape at (180, 174) with radius 70.
; PLAN: r0=180(x), r1=174(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 174
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
