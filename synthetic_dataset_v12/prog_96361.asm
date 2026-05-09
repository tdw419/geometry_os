; DESCRIPTION: Creates a white rectangular region at (235, 210) spanning 62 by 23 pixels.
; PLAN: r0=235(x), r1=210(y), r2=62(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 210
LDI r2, 62
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
