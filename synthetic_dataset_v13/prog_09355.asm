; DESCRIPTION: Draws a red rectangle at (245, 58) with width 60 and height 14.
; PLAN: r0=245(x), r1=58(y), r2=60(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 58
LDI r2, 60
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
