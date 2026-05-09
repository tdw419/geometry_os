; DESCRIPTION: Creates a yellow rectangular region at (326, 81) spanning 115 by 25 pixels.
; PLAN: r0=326(x), r1=81(y), r2=115(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 81
LDI r2, 115
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
