; DESCRIPTION: Creates a white rectangular region at (322, 126) spanning 102 by 67 pixels.
; PLAN: r0=322(x), r1=126(y), r2=102(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 126
LDI r2, 102
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
