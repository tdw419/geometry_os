; DESCRIPTION: Creates a white rectangular region at (102, 93) spanning 64 by 82 pixels.
; PLAN: r0=102(x), r1=93(y), r2=64(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 93
LDI r2, 64
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
