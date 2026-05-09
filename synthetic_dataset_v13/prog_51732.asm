; DESCRIPTION: Creates a red rectangular region at (126, 49) spanning 113 by 93 pixels.
; PLAN: r0=126(x), r1=49(y), r2=113(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 49
LDI r2, 113
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
