; DESCRIPTION: Creates a red rectangular region at (287, 81) spanning 74 by 59 pixels.
; PLAN: r0=287(x), r1=81(y), r2=74(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 81
LDI r2, 74
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
