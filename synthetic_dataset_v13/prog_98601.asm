; DESCRIPTION: Creates a yellow rectangular region at (204, 82) spanning 38 by 98 pixels.
; PLAN: r0=204(x), r1=82(y), r2=38(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 82
LDI r2, 38
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
