; DESCRIPTION: Creates a red rectangular region at (72, 59) spanning 69 by 29 pixels.
; PLAN: r0=72(x), r1=59(y), r2=69(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 59
LDI r2, 69
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
