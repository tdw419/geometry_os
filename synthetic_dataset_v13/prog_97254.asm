; DESCRIPTION: Creates a red rectangular region at (412, 175) spanning 59 by 47 pixels.
; PLAN: r0=412(x), r1=175(y), r2=59(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 175
LDI r2, 59
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
