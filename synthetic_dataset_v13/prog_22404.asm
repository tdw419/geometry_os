; DESCRIPTION: Creates a red rectangular region at (140, 154) spanning 39 by 82 pixels.
; PLAN: r0=140(x), r1=154(y), r2=39(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 154
LDI r2, 39
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
