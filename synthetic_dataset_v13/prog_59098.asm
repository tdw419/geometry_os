; DESCRIPTION: Creates a red rectangular region at (59, 2) spanning 32 by 17 pixels.
; PLAN: r0=59(x), r1=2(y), r2=32(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 2
LDI r2, 32
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
