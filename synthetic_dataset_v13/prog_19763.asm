; DESCRIPTION: Creates a red rectangular region at (158, 16) spanning 48 by 19 pixels.
; PLAN: r0=158(x), r1=16(y), r2=48(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 16
LDI r2, 48
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
