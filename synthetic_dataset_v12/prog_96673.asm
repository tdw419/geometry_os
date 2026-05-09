; DESCRIPTION: Creates a white rectangular region at (418, 17) spanning 68 by 93 pixels.
; PLAN: r0=418(x), r1=17(y), r2=68(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 17
LDI r2, 68
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
