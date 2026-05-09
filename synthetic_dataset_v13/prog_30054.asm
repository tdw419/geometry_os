; DESCRIPTION: Draws a white rectangle at (305, 59) with width 56 and height 28.
; PLAN: r0=305(x), r1=59(y), r2=56(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 59
LDI r2, 56
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
