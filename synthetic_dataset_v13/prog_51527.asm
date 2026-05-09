; DESCRIPTION: Creates a yellow rectangular region at (308, 62) spanning 93 by 38 pixels.
; PLAN: r0=308(x), r1=62(y), r2=93(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 62
LDI r2, 93
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
