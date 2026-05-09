; DESCRIPTION: Creates a white rectangular region at (206, 130) spanning 10 by 37 pixels.
; PLAN: r0=206(x), r1=130(y), r2=10(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 130
LDI r2, 10
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
