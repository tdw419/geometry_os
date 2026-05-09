; DESCRIPTION: Draws a white rectangle at (255, 95) with width 99 and height 16.
; PLAN: r0=255(x), r1=95(y), r2=99(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 95
LDI r2, 99
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
