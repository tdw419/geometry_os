; DESCRIPTION: Draws a white rectangle at (295, 28) with width 21 and height 64.
; PLAN: r0=295(x), r1=28(y), r2=21(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 28
LDI r2, 21
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
