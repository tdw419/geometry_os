; DESCRIPTION: Creates a yellow rectangular region at (473, 125) spanning 11 by 82 pixels.
; PLAN: r0=473(x), r1=125(y), r2=11(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 125
LDI r2, 11
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
