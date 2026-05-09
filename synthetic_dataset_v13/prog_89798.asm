; DESCRIPTION: Creates a red rectangular region at (159, 117) spanning 61 by 117 pixels.
; PLAN: r0=159(x), r1=117(y), r2=61(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 117
LDI r2, 61
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
