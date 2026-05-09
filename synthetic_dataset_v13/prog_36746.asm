; DESCRIPTION: Draws a white rectangle at (368, 60) with width 13 and height 59.
; PLAN: r0=368(x), r1=60(y), r2=13(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 60
LDI r2, 13
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
