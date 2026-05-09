; DESCRIPTION: Creates a red rectangular region at (440, 11) spanning 24 by 82 pixels.
; PLAN: r0=440(x), r1=11(y), r2=24(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 11
LDI r2, 24
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
