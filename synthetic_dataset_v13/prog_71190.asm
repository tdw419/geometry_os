; DESCRIPTION: Creates a red rectangular region at (111, 85) spanning 64 by 90 pixels.
; PLAN: r0=111(x), r1=85(y), r2=64(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 85
LDI r2, 64
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
