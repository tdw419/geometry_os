; DESCRIPTION: Creates a red rectangular region at (315, 125) spanning 26 by 82 pixels.
; PLAN: r0=315(x), r1=125(y), r2=26(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 125
LDI r2, 26
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
