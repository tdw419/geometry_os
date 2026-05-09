; DESCRIPTION: Creates a red rectangular region at (291, 136) spanning 52 by 61 pixels.
; PLAN: r0=291(x), r1=136(y), r2=52(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 136
LDI r2, 52
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
