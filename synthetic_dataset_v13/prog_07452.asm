; DESCRIPTION: Creates a red rectangular region at (336, 184) spanning 55 by 16 pixels.
; PLAN: r0=336(x), r1=184(y), r2=55(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 184
LDI r2, 55
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
