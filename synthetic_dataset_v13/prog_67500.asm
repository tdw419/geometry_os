; DESCRIPTION: Creates a red rectangular region at (52, 24) spanning 14 by 73 pixels.
; PLAN: r0=52(x), r1=24(y), r2=14(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 24
LDI r2, 14
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
