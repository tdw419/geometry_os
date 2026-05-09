; DESCRIPTION: Creates a red rectangular region at (287, 159) spanning 76 by 55 pixels.
; PLAN: r0=287(x), r1=159(y), r2=76(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 159
LDI r2, 76
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
