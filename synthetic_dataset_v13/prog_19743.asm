; DESCRIPTION: Creates a red rectangular region at (90, 239) spanning 118 by 17 pixels.
; PLAN: r0=90(x), r1=239(y), r2=118(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 239
LDI r2, 118
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
