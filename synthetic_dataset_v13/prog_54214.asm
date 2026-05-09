; DESCRIPTION: Creates a red rectangular region at (388, 206) spanning 43 by 29 pixels.
; PLAN: r0=388(x), r1=206(y), r2=43(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 206
LDI r2, 43
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
