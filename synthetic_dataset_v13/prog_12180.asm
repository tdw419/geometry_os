; DESCRIPTION: Creates a red rectangular region at (352, 35) spanning 38 by 59 pixels.
; PLAN: r0=352(x), r1=35(y), r2=38(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 35
LDI r2, 38
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
