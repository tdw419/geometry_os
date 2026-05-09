; DESCRIPTION: Creates a red rectangular region at (308, 72) spanning 99 by 39 pixels.
; PLAN: r0=308(x), r1=72(y), r2=99(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 72
LDI r2, 99
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
