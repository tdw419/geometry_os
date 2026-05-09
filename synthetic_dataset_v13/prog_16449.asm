; DESCRIPTION: Creates a red rectangular region at (159, 134) spanning 31 by 93 pixels.
; PLAN: r0=159(x), r1=134(y), r2=31(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 134
LDI r2, 31
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
