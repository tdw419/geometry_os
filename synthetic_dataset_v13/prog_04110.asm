; DESCRIPTION: Creates a yellow rectangular region at (372, 25) spanning 82 by 108 pixels.
; PLAN: r0=372(x), r1=25(y), r2=82(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 25
LDI r2, 82
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
