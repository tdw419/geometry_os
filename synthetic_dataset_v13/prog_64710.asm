; DESCRIPTION: Creates a red rectangular region at (151, 10) spanning 53 by 25 pixels.
; PLAN: r0=151(x), r1=10(y), r2=53(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 10
LDI r2, 53
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
