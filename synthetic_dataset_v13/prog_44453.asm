; DESCRIPTION: Creates a red rectangular region at (162, 53) spanning 82 by 113 pixels.
; PLAN: r0=162(x), r1=53(y), r2=82(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 53
LDI r2, 82
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
