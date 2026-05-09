; DESCRIPTION: Creates a red rectangular region at (118, 162) spanning 32 by 61 pixels.
; PLAN: r0=118(x), r1=162(y), r2=32(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 162
LDI r2, 32
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
