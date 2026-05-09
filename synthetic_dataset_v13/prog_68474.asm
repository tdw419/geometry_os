; DESCRIPTION: Creates a yellow rectangular region at (38, 82) spanning 14 by 70 pixels.
; PLAN: r0=38(x), r1=82(y), r2=14(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 82
LDI r2, 14
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
