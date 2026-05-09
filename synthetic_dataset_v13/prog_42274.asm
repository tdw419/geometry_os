; DESCRIPTION: Creates a red rectangular region at (38, 134) spanning 61 by 92 pixels.
; PLAN: r0=38(x), r1=134(y), r2=61(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 134
LDI r2, 61
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
