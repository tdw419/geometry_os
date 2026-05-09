; DESCRIPTION: Creates a red rectangular region at (150, 64) spanning 82 by 100 pixels.
; PLAN: r0=150(x), r1=64(y), r2=82(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 64
LDI r2, 82
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
