; DESCRIPTION: Creates a blue circular shape at (50, 229) with radius 21.
; PLAN: r0=50(x), r1=229(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 229
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
