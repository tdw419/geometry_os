; DESCRIPTION: Creates a red rectangular region at (107, 40) spanning 17 by 33 pixels.
; PLAN: r0=107(x), r1=40(y), r2=17(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 40
LDI r2, 17
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
