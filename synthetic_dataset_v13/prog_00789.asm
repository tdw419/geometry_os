; DESCRIPTION: Draws a cyan rectangle at (346, 59) with width 88 and height 37.
; PLAN: r0=346(x), r1=59(y), r2=88(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 59
LDI r2, 88
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
