; DESCRIPTION: Creates a red rectangular region at (244, 112) spanning 93 by 39 pixels.
; PLAN: r0=244(x), r1=112(y), r2=93(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 112
LDI r2, 93
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
