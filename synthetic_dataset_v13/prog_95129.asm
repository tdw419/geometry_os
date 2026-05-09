; DESCRIPTION: Creates a yellow rectangular region at (406, 128) spanning 81 by 29 pixels.
; PLAN: r0=406(x), r1=128(y), r2=81(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 128
LDI r2, 81
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
