; DESCRIPTION: Creates a red rectangular region at (90, 38) spanning 23 by 32 pixels.
; PLAN: r0=90(x), r1=38(y), r2=23(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 38
LDI r2, 23
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
