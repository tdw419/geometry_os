; DESCRIPTION: Creates a red rectangular region at (228, 88) spanning 29 by 93 pixels.
; PLAN: r0=228(x), r1=88(y), r2=29(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 88
LDI r2, 29
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
