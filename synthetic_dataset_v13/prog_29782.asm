; DESCRIPTION: Creates a red rectangular region at (286, 172) spanning 42 by 76 pixels.
; PLAN: r0=286(x), r1=172(y), r2=42(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 172
LDI r2, 42
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
