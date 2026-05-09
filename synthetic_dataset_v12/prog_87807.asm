; DESCRIPTION: Creates a white rectangular region at (101, 127) spanning 15 by 13 pixels.
; PLAN: r0=101(x), r1=127(y), r2=15(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 127
LDI r2, 15
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
