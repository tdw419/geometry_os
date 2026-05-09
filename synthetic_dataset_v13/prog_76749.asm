; DESCRIPTION: Creates a red rectangular region at (274, 131) spanning 18 by 60 pixels.
; PLAN: r0=274(x), r1=131(y), r2=18(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 131
LDI r2, 18
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
