; DESCRIPTION: Creates a white rectangular region at (405, 133) spanning 105 by 53 pixels.
; PLAN: r0=405(x), r1=133(y), r2=105(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 133
LDI r2, 105
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
