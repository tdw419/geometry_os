; DESCRIPTION: Creates a red rectangular region at (166, 87) spanning 18 by 17 pixels.
; PLAN: r0=166(x), r1=87(y), r2=18(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 87
LDI r2, 18
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
