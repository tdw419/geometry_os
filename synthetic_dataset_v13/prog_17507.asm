; DESCRIPTION: Creates a red rectangular region at (19, 134) spanning 27 by 61 pixels.
; PLAN: r0=19(x), r1=134(y), r2=27(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 134
LDI r2, 27
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
