; DESCRIPTION: Creates a red rectangular region at (372, 0) spanning 29 by 71 pixels.
; PLAN: r0=372(x), r1=0(y), r2=29(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 0
LDI r2, 29
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
