; DESCRIPTION: Creates a red rectangular region at (3, 29) spanning 15 by 80 pixels.
; PLAN: r0=3(x), r1=29(y), r2=15(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 29
LDI r2, 15
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
