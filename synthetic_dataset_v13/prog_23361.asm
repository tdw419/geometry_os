; DESCRIPTION: Renders a white box of size 105x33 starting at (346, 184).
; PLAN: r0=346(x), r1=184(y), r2=105(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 184
LDI r2, 105
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
