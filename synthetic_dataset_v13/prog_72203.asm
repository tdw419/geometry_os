; DESCRIPTION: Creates a red rectangular region at (322, 65) spanning 105 by 62 pixels.
; PLAN: r0=322(x), r1=65(y), r2=105(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 65
LDI r2, 105
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
