; DESCRIPTION: Draws a cyan circle centered at (222, 152) with radius 42.
; PLAN: r0=222(x), r1=152(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 152
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
