; DESCRIPTION: Creates a red rectangular region at (61, 32) spanning 113 by 36 pixels.
; PLAN: r0=61(x), r1=32(y), r2=113(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 32
LDI r2, 113
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
