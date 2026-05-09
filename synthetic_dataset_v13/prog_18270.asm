; DESCRIPTION: Draws a cyan circle centered at (210, 152) with radius 52.
; PLAN: r0=210(x), r1=152(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 152
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
