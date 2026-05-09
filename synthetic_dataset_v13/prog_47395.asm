; DESCRIPTION: Creates a red rectangular region at (308, 188) spanning 83 by 58 pixels.
; PLAN: r0=308(x), r1=188(y), r2=83(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 188
LDI r2, 83
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
