; DESCRIPTION: Creates a red rectangular region at (209, 16) spanning 17 by 85 pixels.
; PLAN: r0=209(x), r1=16(y), r2=17(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 16
LDI r2, 17
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
