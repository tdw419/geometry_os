; DESCRIPTION: Creates a red rectangular region at (16, 4) spanning 23 by 105 pixels.
; PLAN: r0=16(x), r1=4(y), r2=23(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 4
LDI r2, 23
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
