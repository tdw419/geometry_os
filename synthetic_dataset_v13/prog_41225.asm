; DESCRIPTION: Creates a yellow rectangular region at (56, 93) spanning 35 by 27 pixels.
; PLAN: r0=56(x), r1=93(y), r2=35(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 93
LDI r2, 35
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
