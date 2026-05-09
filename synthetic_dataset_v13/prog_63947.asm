; DESCRIPTION: Creates a red rectangular region at (322, 146) spanning 67 by 55 pixels.
; PLAN: r0=322(x), r1=146(y), r2=67(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 146
LDI r2, 67
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
