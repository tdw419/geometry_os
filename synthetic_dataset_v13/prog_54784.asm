; DESCRIPTION: Creates a red rectangular region at (382, 32) spanning 57 by 72 pixels.
; PLAN: r0=382(x), r1=32(y), r2=57(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 32
LDI r2, 57
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
