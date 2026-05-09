; DESCRIPTION: Creates a black rectangular region at (216, 29) spanning 82 by 120 pixels.
; PLAN: r0=216(x), r1=29(y), r2=82(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 29
LDI r2, 82
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
