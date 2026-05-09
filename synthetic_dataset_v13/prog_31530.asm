; DESCRIPTION: Creates a yellow rectangular region at (138, 56) spanning 70 by 48 pixels.
; PLAN: r0=138(x), r1=56(y), r2=70(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 56
LDI r2, 70
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
