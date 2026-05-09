; DESCRIPTION: Creates a red rectangular region at (238, 98) spanning 49 by 91 pixels.
; PLAN: r0=238(x), r1=98(y), r2=49(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 98
LDI r2, 49
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
