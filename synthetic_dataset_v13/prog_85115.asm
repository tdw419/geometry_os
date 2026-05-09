; DESCRIPTION: Creates a red rectangular region at (240, 19) spanning 95 by 27 pixels.
; PLAN: r0=240(x), r1=19(y), r2=95(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 19
LDI r2, 95
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
