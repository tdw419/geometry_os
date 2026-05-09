; DESCRIPTION: Creates a red rectangular region at (168, 31) spanning 96 by 103 pixels.
; PLAN: r0=168(x), r1=31(y), r2=96(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 31
LDI r2, 96
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
