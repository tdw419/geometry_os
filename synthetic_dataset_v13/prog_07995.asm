; DESCRIPTION: Creates a red rectangular region at (25, 50) spanning 96 by 56 pixels.
; PLAN: r0=25(x), r1=50(y), r2=96(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 50
LDI r2, 96
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
