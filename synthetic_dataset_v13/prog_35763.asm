; DESCRIPTION: Creates a red rectangular region at (2, 230) spanning 93 by 23 pixels.
; PLAN: r0=2(x), r1=230(y), r2=93(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 230
LDI r2, 93
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
