; DESCRIPTION: Creates a red rectangular region at (168, 102) spanning 45 by 14 pixels.
; PLAN: r0=168(x), r1=102(y), r2=45(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 102
LDI r2, 45
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
