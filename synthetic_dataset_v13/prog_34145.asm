; DESCRIPTION: Creates a white rectangular region at (294, 176) spanning 40 by 17 pixels.
; PLAN: r0=294(x), r1=176(y), r2=40(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 176
LDI r2, 40
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
