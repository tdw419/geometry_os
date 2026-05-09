; DESCRIPTION: Creates a cyan circular shape at (222, 133) with radius 60.
; PLAN: r0=222(x), r1=133(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 133
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
