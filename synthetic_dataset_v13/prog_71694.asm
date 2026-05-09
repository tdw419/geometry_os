; DESCRIPTION: Creates a red rectangular region at (232, 27) spanning 23 by 59 pixels.
; PLAN: r0=232(x), r1=27(y), r2=23(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 27
LDI r2, 23
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
