; DESCRIPTION: Creates a white rectangular region at (265, 93) spanning 74 by 116 pixels.
; PLAN: r0=265(x), r1=93(y), r2=74(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 93
LDI r2, 74
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
