; DESCRIPTION: Creates a yellow rectangular region at (467, 53) spanning 45 by 62 pixels.
; PLAN: r0=467(x), r1=53(y), r2=45(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 53
LDI r2, 45
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
