; DESCRIPTION: Creates a white rectangular region at (230, 189) spanning 93 by 13 pixels.
; PLAN: r0=230(x), r1=189(y), r2=93(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 189
LDI r2, 93
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
