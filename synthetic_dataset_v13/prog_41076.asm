; DESCRIPTION: Draws a green rectangle at (126, 173) with width 34 and height 27.
; PLAN: r0=126(x), r1=173(y), r2=34(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 173
LDI r2, 34
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
