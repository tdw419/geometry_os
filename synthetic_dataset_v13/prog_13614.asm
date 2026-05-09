; DESCRIPTION: Creates a red rectangular region at (342, 92) spanning 71 by 32 pixels.
; PLAN: r0=342(x), r1=92(y), r2=71(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 92
LDI r2, 71
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
