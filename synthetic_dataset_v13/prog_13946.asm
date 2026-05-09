; DESCRIPTION: Creates a red rectangular region at (387, 62) spanning 103 by 96 pixels.
; PLAN: r0=387(x), r1=62(y), r2=103(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 62
LDI r2, 103
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
