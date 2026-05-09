; DESCRIPTION: Creates a red rectangular region at (87, 10) spanning 99 by 96 pixels.
; PLAN: r0=87(x), r1=10(y), r2=99(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 10
LDI r2, 99
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
