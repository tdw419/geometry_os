; DESCRIPTION: Draws a white rectangle at (346, 121) with width 48 and height 102.
; PLAN: r0=346(x), r1=121(y), r2=48(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 121
LDI r2, 48
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
