; DESCRIPTION: Creates a yellow rectangular region at (403, 49) spanning 109 by 107 pixels.
; PLAN: r0=403(x), r1=49(y), r2=109(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 49
LDI r2, 109
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
