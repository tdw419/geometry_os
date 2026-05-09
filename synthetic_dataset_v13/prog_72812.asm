; DESCRIPTION: Draws a white rectangle at (58, 25) with width 16 and height 59.
; PLAN: r0=58(x), r1=25(y), r2=16(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 25
LDI r2, 16
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
