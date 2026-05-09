; DESCRIPTION: Creates a red rectangular region at (198, 26) spanning 76 by 24 pixels.
; PLAN: r0=198(x), r1=26(y), r2=76(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 26
LDI r2, 76
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
