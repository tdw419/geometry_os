; DESCRIPTION: Draws a orange rectangle at (415, 58) with width 62 and height 109.
; PLAN: r0=415(x), r1=58(y), r2=62(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 58
LDI r2, 62
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
