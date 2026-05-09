; DESCRIPTION: Creates a white rectangular region at (279, 176) spanning 27 by 20 pixels.
; PLAN: r0=279(x), r1=176(y), r2=27(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 176
LDI r2, 27
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
