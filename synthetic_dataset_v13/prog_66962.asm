; DESCRIPTION: Draws a black rectangle at (305, 29) with width 97 and height 48.
; PLAN: r0=305(x), r1=29(y), r2=97(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 29
LDI r2, 97
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
