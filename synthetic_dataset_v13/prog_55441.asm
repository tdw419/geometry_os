; DESCRIPTION: Creates a red rectangular region at (328, 193) spanning 53 by 62 pixels.
; PLAN: r0=328(x), r1=193(y), r2=53(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 193
LDI r2, 53
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
