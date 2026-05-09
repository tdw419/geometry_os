; DESCRIPTION: Creates a black rectangular region at (345, 32) spanning 100 by 47 pixels.
; PLAN: r0=345(x), r1=32(y), r2=100(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 32
LDI r2, 100
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
