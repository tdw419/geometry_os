; DESCRIPTION: Draws a black rectangle at (305, 206) with width 95 and height 28.
; PLAN: r0=305(x), r1=206(y), r2=95(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 206
LDI r2, 95
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
