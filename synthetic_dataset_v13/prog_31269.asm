; DESCRIPTION: Creates a red rectangular region at (20, 34) spanning 25 by 16 pixels.
; PLAN: r0=20(x), r1=34(y), r2=25(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 34
LDI r2, 25
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
