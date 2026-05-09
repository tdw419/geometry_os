; DESCRIPTION: Creates a white rectangular region at (59, 116) spanning 68 by 92 pixels.
; PLAN: r0=59(x), r1=116(y), r2=68(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 116
LDI r2, 68
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
