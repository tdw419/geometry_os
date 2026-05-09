; DESCRIPTION: Creates a red rectangular region at (13, 143) spanning 32 by 58 pixels.
; PLAN: r0=13(x), r1=143(y), r2=32(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 143
LDI r2, 32
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
