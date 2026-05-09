; DESCRIPTION: Creates a red rectangular region at (329, 155) spanning 82 by 55 pixels.
; PLAN: r0=329(x), r1=155(y), r2=82(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 155
LDI r2, 82
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
