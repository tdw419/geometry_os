; DESCRIPTION: Draws a yellow rectangle at (294, 61) with width 116 and height 68.
; PLAN: r0=294(x), r1=61(y), r2=116(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 61
LDI r2, 116
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
