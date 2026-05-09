; DESCRIPTION: Creates a red rectangular region at (165, 71) spanning 27 by 100 pixels.
; PLAN: r0=165(x), r1=71(y), r2=27(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 71
LDI r2, 27
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
