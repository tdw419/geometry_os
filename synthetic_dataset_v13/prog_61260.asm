; DESCRIPTION: Creates a red rectangular region at (282, 176) spanning 82 by 75 pixels.
; PLAN: r0=282(x), r1=176(y), r2=82(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 176
LDI r2, 82
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
