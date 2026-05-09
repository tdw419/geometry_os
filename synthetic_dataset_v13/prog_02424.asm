; DESCRIPTION: Creates a red rectangular region at (256, 68) spanning 66 by 60 pixels.
; PLAN: r0=256(x), r1=68(y), r2=66(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 68
LDI r2, 66
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
