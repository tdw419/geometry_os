; DESCRIPTION: Creates a yellow rectangular region at (48, 81) spanning 28 by 115 pixels.
; PLAN: r0=48(x), r1=81(y), r2=28(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 81
LDI r2, 28
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
