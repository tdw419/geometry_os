; DESCRIPTION: Creates a red rectangular region at (28, 25) spanning 24 by 35 pixels.
; PLAN: r0=28(x), r1=25(y), r2=24(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 25
LDI r2, 24
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
