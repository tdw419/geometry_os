; DESCRIPTION: Draws a yellow rectangle at (425, 121) with width 48 and height 39.
; PLAN: r0=425(x), r1=121(y), r2=48(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 121
LDI r2, 48
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
