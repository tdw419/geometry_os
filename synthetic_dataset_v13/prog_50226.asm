; DESCRIPTION: Creates a yellow rectangular region at (27, 55) spanning 81 by 99 pixels.
; PLAN: r0=27(x), r1=55(y), r2=81(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 55
LDI r2, 81
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
