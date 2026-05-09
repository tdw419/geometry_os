; DESCRIPTION: Creates a yellow rectangular region at (64, 151) spanning 25 by 43 pixels.
; PLAN: r0=64(x), r1=151(y), r2=25(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 151
LDI r2, 25
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
