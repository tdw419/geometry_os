; DESCRIPTION: Creates a red rectangular region at (5, 141) spanning 24 by 32 pixels.
; PLAN: r0=5(x), r1=141(y), r2=24(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 141
LDI r2, 24
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
