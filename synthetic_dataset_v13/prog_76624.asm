; DESCRIPTION: Creates a red rectangular region at (240, 17) spanning 27 by 58 pixels.
; PLAN: r0=240(x), r1=17(y), r2=27(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 17
LDI r2, 27
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
