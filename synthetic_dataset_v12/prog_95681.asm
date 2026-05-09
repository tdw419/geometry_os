; DESCRIPTION: Creates a black rectangular region at (358, 7) spanning 14 by 59 pixels.
; PLAN: r0=358(x), r1=7(y), r2=14(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 7
LDI r2, 14
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
