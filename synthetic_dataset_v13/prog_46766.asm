; DESCRIPTION: Draws a yellow rectangle at (482, 11) with width 16 and height 31.
; PLAN: r0=482(x), r1=11(y), r2=16(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 11
LDI r2, 16
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
