; DESCRIPTION: Creates a red rectangular region at (96, 99) spanning 56 by 63 pixels.
; PLAN: r0=96(x), r1=99(y), r2=56(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 99
LDI r2, 56
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
