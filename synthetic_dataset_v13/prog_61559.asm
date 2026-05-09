; DESCRIPTION: Draws a white rectangle at (305, 224) with width 76 and height 29.
; PLAN: r0=305(x), r1=224(y), r2=76(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 224
LDI r2, 76
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
