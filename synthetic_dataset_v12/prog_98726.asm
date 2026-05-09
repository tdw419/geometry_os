; DESCRIPTION: Creates a purple circular shape at (440, 186) with radius 16.
; PLAN: r0=440(x), r1=186(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 186
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
